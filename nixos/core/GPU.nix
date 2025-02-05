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
    ];
    hardware.nvidia = {
        package = config.boot.kernelPackages.nvidiaPackages.stable;
        prime = {
      #sync.enable = true;
            offload.enable = true;
      #     offload.enableOffloadCmd = true;
            intelBusId = "PCI:0:2:0";
            nvidiaBusId = "PCI:1:0:0";
        };
        modesetting.enable = true;
        powerManagement.enable = false;
        powerManagement.finegrained = false;
        open = false;
        nvidiaSettings = false;
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
