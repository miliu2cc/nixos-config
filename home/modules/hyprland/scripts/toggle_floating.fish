#!/usr/bin/env fish

# 获取当前活动窗口的浮动状态和类名
set floating (hyprctl activewindow -j | jq '.floating')
set window (hyprctl activewindow -j | jq -r '.initialClass')

# 定义切换函数
function toggle
    set width $argv[1]
    set height $argv[2]

    hyprctl --batch "dispatch togglefloating; dispatch resizeactive exact $width $height; dispatch centerwindow"
end

# 定义取消切换函数
function untoggle
    hyprctl dispatch togglefloating
end

# 定义处理函数
function handle
    set width $argv[1]
    set height $argv[2]

    if test $floating = "false"
        toggle $width $height
    else
        untoggle
    end
end

# 根据窗口类名执行相应操作
switch $window
    case 'kitty'
        handle "50%" "55%"
    case '*'
        handle "70%" "70%"
end
