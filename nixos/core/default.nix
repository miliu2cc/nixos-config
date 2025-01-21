{ config, pkgs, inputs, lib, ... }:
{
    imports = [
        ./hardware-configuration.nix
        ./bootloader.nix
        ./daed.nix
        #./GPU.nix
        ./i18n.nix
        ./network.nix
        ./fish.nix
        ./services.nix
        ./system.nix
        ./SQL.nix
        ./user.nix
    ];
}
