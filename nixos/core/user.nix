{ pkgs, inputs, ... }:
{
    imports = [
        inputs.home-manager.nixosModules.home-manager
    ];
    home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "backup";
        users.miliu = {
            imports = [
                ../../home
            ];
            home.username = "miliu";
            home.homeDirectory = "/home/miliu";
            home.stateVersion = "24.11";
            programs.home-manager.enable = true;
        };
    };

    users.users.miliu = {
        isNormalUser = true;
        description = "miliu";
        shell = pkgs.fish;
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [
            kdePackages.kate
        ];
    };
}
