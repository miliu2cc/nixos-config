{ config, pkgs, inputs, ... }:
{
    boot.loader.systemd-boot.enable = false;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "nodev";
    boot.loader.grub.efiSupport = true;
    boot.loader.grub.useOSProber = true;
    boot.kernelPackages = pkgs.linuxPackages_zen;
    boot.extraModulePackages = [config.boot.kernelPackages.acpi_call];
    boot.kernelModules = [ "acpi_call" ];
    
}
