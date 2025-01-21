{pkgs, ...}:
{
    home.packages = with pkgs; [
      noto-fonts
      (nerdfonts.override { fonts = [
        "JetBrainsMono"
      ];})
    ];
}
