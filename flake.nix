{
  description = "Home Manager configuration";

  inputs = {

    nurpkgs.url = "github:nix-community/NUR";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    arkenfox = {
      url = "github:dwarfmaster/arkenfox-nixos";
      inputs.nixpkgs.follows = "home-manager";
    };

    neovim-flake = {
      url = "github:notashelf/neovim-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ self, nixpkgs, nur, home-manager, arkenfox, neovim-flake, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

    in {
      homeConfigurations.petarch = home-manager.lib.homeManagerConfiguration {

        extraSpecialArgs = {
          inherit self;
          inherit nur;
        };

        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        modules = [
          ./home.nix
          nur.nixosModules.nur
          arkenfox.hmModules.default
          inputs.neovim-flake.homeManagerModules.default

        ];
      };
    };
}
