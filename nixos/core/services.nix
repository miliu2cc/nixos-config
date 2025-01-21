{ config, pkgs, inputs, ... }:
{
    services = {
        xserver.enable = true;
        displayManager.sddm.enable = true;
        desktopManager.plasma6.enable = true;
        xserver.xkb = {
            layout = "us";
            variant = "";
        };
        printing.enable = true;
        pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
    
        };
        flatpak.enable = true;
    };
    
}
