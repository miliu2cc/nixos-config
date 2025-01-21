{ config, pkgs, lib, ... }:

{
  
  home.file.".config/hypr/hyprland.conf".source = ./default.conf;
  home.file.".config/hypr/hyprlock.conf".source = ./hyprlock.conf;
  
}
