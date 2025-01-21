{pkgs, ...}:
{
    home.packages = with pkgs;[
        networkmanager
        wireplumber
        libgtop
        dart-sass
        wl-clipboard
        gvfs
    ];
}