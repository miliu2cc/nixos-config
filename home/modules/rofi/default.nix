{pkgs, ...}:
{
    programs.rofi = {
        enable = true;
        theme = ./themes/catppuccin-macchiato.rasi;
    };
}