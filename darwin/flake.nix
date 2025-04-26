{
  description = "Nix for darwin configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    
    nix-darwin = {
      url = "github:LnL7/nix-darwin/nix-darwin-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mac-app-util.url = "github:hraban/mac-app-util";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
  };

  outputs = inputs @ {
    self,
    nix-darwin,
    nixpkgs,
    home-manager,
    mac-app-util,
    nix-vscode-extensions,
    ...
  }: let
    username = "lucas";
    useremail = "mendes.lucas9498@gmail.com";
    system = "x86_64-darwin"; # aarch64-darwin or x86_64-darwin
    hostname = "mbp-i5-lucas";
    specialArgs = { inherit inputs username useremail hostname; };
 in {
      
    darwinConfigurations."${hostname}" = nix-darwin.lib.darwinSystem {
        inherit system specialArgs;
        modules = [
          mac-app-util.darwinModules.default  
          ./modules/core.nix
          ./sys.nix
          ./modules/apps.nix
          ./modules/users.nix
          home-manager.darwinModules.home-manager 
          {
             home-manager.useGlobalPkgs = true;
             home-manager.useUserPackages = true;
             home-manager.extraSpecialArgs = specialArgs;

             home-manager.sharedModules = [
                mac-app-util.homeManagerModules.default
             ];

             home-manager.users.${username}.imports = [
               ./home.nix
             ];
          }
        ];
      };
    };
}

