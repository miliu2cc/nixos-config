{ config, pkgs, lib, ... }:
{
    #GPU
    hardware.graphics = {
        enable = true;
        #driSupport = true;
        #driSupport32Bit = true;
    };
    services.xserver.videoDrivers = ["nvidia"];
    boot.kernelParams = [
        "nvidia-drm.modeset=1"
        "nvidia-drm.fbdev=1"
    ];
    hardware.nvidia = {
        package = config.boot.kernelPackages.nvidiaPackages.latest;
        prime = {
            #sync.enable = true;
            offload.enable = true;
            intelBusId = "PCI:0:2:0";
            nvidiaBusId = "PCI:1:0:0";
        };
        modesetting.enable = true;
        powerManagement.enable = true;
        powerManagement.finegrained = false;
        open = false;
        nvidiaSettings = true;
    };
    /*specialisation = {
        on-the-go.configuration = {
            system.nixos.tags = [ "on-the-go" ];
                hardware.nvidia = {
                prime.offload.enable = lib.mkForce true;
                prime.offload.enableOffloadCmd = lib.mkForce true;
                prime.sync.enable = lib.mkForce false;
            };
        };
    };*/
}