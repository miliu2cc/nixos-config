{ config, pkgs, inputs, ... }:
{
    time.timeZone = "Asia/Shanghai";
    environment = {
        variables = {
            GTK_IM_MODULE = "fcitx";
            QT_IM_MODULE = "fcitx";
            XMODIFIERS = "@im=fcitx";
            EDITOR = "nvim";
        };
        systemPackages = with pkgs; [
            wget
            git
            blueman
            hyprpanel
            iwgtk
            bluez
            #fan
            nbfc-linux
            polkit
            nodejs_23
            hyprlock
            pkg-config

            #theme & cursor
            catppuccin
            google-cursor

            #lang
            python3
            uv
            
            #rust
            rust-analyzer
            rustc
            cargo
            
            #c
            gcc
        ];
    };
    #启用非自由软件
    nixpkgs.config.allowUnfree = true;
    #启用不支持系统
    #nixpkgs.config.allowUnsupportedSystem = true;
    nixpkgs.config.nvidia.acceptLicense = true;
    #允许broken包
    #nixpkgs.config.allowBroken = true;
    #启用flake
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    #program项目
    programs.hyprland.enable = true;


    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    system.stateVersion = "24.11";
}
