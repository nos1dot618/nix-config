{
  
  description = "Nosferatu's flake!";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      inputs.nixpkgs.url = "nixpkgs";
      url = "github:nix-community/home-manager/master";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        orava = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./profiles/orava-i3wm/configuration.nix ];
        };
      };
      homeConfigurations = {
        nosferatu = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./profiles/orava-i3wm/home.nix ];
        };
      };
    };
  
}
