#!/usr/bin/env bash
# =============================================================================
#  gezatest / box.launch 启动脚本
#  用途: 绕开 VMware 虚拟机里 Gazebo 界面 (gzclient) 崩溃的问题
#
#  症状 (直接 roslaunch box.launch 时):
#      VMware: vmw_ioctl_command error 无效的参数.
#      Aborted (core dumped)
#      [gazebo_gui-3] process has died [pid 4303, exit code 134, ... gzclient ...]
#
#  说明: gzserver 和 spawn_model 都是正常的, 只有装界面的 gzclient 挂了。
#        gzclient 用 OGRE 建 OpenGL 渲染窗口, 走的是 VMware 虚拟 GPU
#        (vmwgfx / Mesa svga 驱动) 的 3D 加速通道。该通道提交命令失败(EINVAL)
#        时 OGRE 拿不到可用的渲染上下文, 于是直接 abort(退出码 134)。
#        跟 launch 文件 / urdf / ROS 本身没有任何关系。
#
#  用法 (用 bash 执行最保险, 不依赖文件的可执行权限):
#    bash ~/gtt_ws/src/gezatest/scripts/run_box.sh            默认, 软件渲染, 最稳
#    bash ~/gtt_ws/src/gezatest/scripts/run_box.sh gpu        保留 VMware 3D 加速再试
#    bash ~/gtt_ws/src/gezatest/scripts/run_box.sh headless   不开界面, 只跑物理
#    bash ~/gtt_ws/src/gezatest/scripts/run_box.sh diag       查看当前 OpenGL 渲染器
#    bash ~/gtt_ws/src/gezatest/scripts/run_box.sh persist    永久写进 ~/.bashrc
#
#  多出来的参数会原样传给 roslaunch, 例如:
#    bash ~/gtt_ws/src/gezatest/scripts/run_box.sh software verbose:=true
# =============================================================================

set -eo pipefail

WS="${GTT_WS:-$HOME/gtt_ws}"
SETUP_ROS="/opt/ros/melodic/setup.bash"
SETUP_WS="$WS/devel/setup.bash"

MODE="${1:-software}"
if [ $# -gt 0 ]; then shift; fi

# --- 核心修复: 关掉 VMware 虚拟 GPU 的 VGPU10 命令通道 ----------------------
# 这条是所有模式都加上的, 对别的 OpenGL 程序也无害。
export SVGA_VGPU10=0

usage() {
    sed -n '17,25p' "$0"
}

show_renderer() {
    echo "--- 当前 OpenGL 渲染器 ---"
    echo "SVGA_VGPU10=${SVGA_VGPU10:-<未设置>}"
    echo "LIBGL_ALWAYS_SOFTWARE=${LIBGL_ALWAYS_SOFTWARE:-<未设置>}"
    if command -v glxinfo >/dev/null 2>&1; then
        glxinfo -B 2>/dev/null | grep -Ei "OpenGL renderer|OpenGL version|Device:" || true
    else
        echo "(没装 mesa-utils, 先执行: sudo apt install -y mesa-utils)"
    fi
    echo "renderer 显示 llvmpipe/softpipe = 软件渲染; 显示 VMware SVGA3D = 走的虚拟 GPU"
}

case "$MODE" in
    software)
        # 强制 Mesa 用 CPU 软件渲染(llvmpipe), 完全不碰 VMware 的 3D 通道。
        # 慢一点, 但空世界 + 一个方块完全够用, 而且 100% 不会再 abort。
        export LIBGL_ALWAYS_SOFTWARE=1
        echo "[run_box] 模式: software (软件渲染, 最稳)"
        ;;
    gpu)
        # 保留 VMware 3D 加速, 只禁用出问题的 VGPU10 路径。能用的话帧率更好。
        unset LIBGL_ALWAYS_SOFTWARE || true
        echo "[run_box] 模式: gpu (VMware 3D 加速 + 禁用 VGPU10)"
        echo "[run_box] 如果界面又挂了, 改回默认模式再跑一次:"
        echo "[run_box]   bash $0 software"
        ;;
    headless)
        unset LIBGL_ALWAYS_SOFTWARE || true
        echo "[run_box] 模式: headless (不开 Gazebo 界面, 物理引擎照常运行)"
        ;;
    diag)
        show_renderer
        exit 0
        ;;
    persist)
        MARK="# >>> gezatest vmware gazebo fix >>>"
        if grep -qF "$MARK" "$HOME/.bashrc" 2>/dev/null; then
            echo "[run_box] ~/.bashrc 里已经有这段配置了, 跳过。"
        else
            if [ -f "$HOME/.bashrc" ]; then
                BAK="$HOME/.bashrc.bak.$(date +%Y%m%d%H%M%S)"
                cp "$HOME/.bashrc" "$BAK"
                echo "[run_box] 原 ~/.bashrc 已备份为 $BAK"
            else
                touch "$HOME/.bashrc"
                echo "[run_box] 没有 ~/.bashrc, 已新建一个"
            fi
            cat >> "$HOME/.bashrc" <<'EOF'

# >>> gezatest vmware gazebo fix >>>
# VMware 虚拟 GPU 的 VGPU10 命令通道会让 Gazebo 界面 abort, 禁用之。
export SVGA_VGPU10=0
# 强制软件渲染。虚拟机里这是最稳的做法; 想让 Gazebo 用回虚拟 GPU 加速
# (帧率更高, 但可能再次崩溃) 就把下面这行注释掉, 或者用
#   bash ~/gtt_ws/src/gezatest/scripts/run_box.sh gpu
export LIBGL_ALWAYS_SOFTWARE=1
# <<< gezatest vmware gazebo fix <<<
EOF
            echo "[run_box] 已写入 ~/.bashrc。"
            echo "[run_box] 新开一个终端, 或者执行 source ~/.bashrc 之后即可直接 roslaunch。"
        fi
        exit 0
        ;;
    -h|--help|help)
        usage
        exit 0
        ;;
    *)
        echo "[run_box] 未知模式: $MODE" >&2
        usage
        exit 2
        ;;
esac

if [ ! -f "$SETUP_ROS" ]; then
    echo "[run_box] 找不到 $SETUP_ROS, 请确认装的是 ROS Melodic。" >&2
    exit 1
fi
if [ ! -f "$SETUP_WS" ]; then
    echo "[run_box] 找不到 $SETUP_WS, 先编译工作空间:" >&2
    echo "[run_box]   cd $WS && catkin_make" >&2
    exit 1
fi

# shellcheck disable=SC1090
source "$SETUP_ROS"
# shellcheck disable=SC1090
source "$SETUP_WS"

echo "[run_box] 渲染器确认:"
show_renderer
echo

ARGS=(gezatest box.launch)
if [ "$MODE" = "headless" ]; then
    ARGS+=(gui:=false)
fi

exec roslaunch "${ARGS[@]}" "$@"
