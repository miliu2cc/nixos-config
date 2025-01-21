{
  description = "My NixOS flake";

  inputs = {
    # NixOS 官方软件源，这里使用 nixos-24.11 分支
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixOS/nixpkgs/nixos-unstable";
     home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
    };
    daeuniverse.url = "github:daeuniverse/flake.nix";
    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      #inputs.nixpkgs.follows = "nixpkgs";
    };

    nbfc-linux = {
      url = "github:nbfc-linux/nbfc-linux";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, hyprpanel,  ... }@inputs: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      
      #config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
    in 
    {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit self inputs ;};
        modules = [
          {nixpkgs.overlays = [inputs.hyprpanel.overlay];}
          ./nixos
          inputs.daeuniverse.nixosModules.dae
          inputs.daeuniverse.nixosModules.daed
        ];
      };
    };
  };
}
