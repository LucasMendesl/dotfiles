{ pkgs, inputs,  ... }: 

let 
 nix-vscode-extensions = inputs.nix-vscode-extension;
in {
  
  # enable flakes globally
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
     inputs.nix-vscode-extensions.overlays.default
  ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  
  nix.package = pkgs.nix;

  # do garbage collection weekly to keep disk usage low
  nix.gc = {
    automatic = true;
    options = "--delete-older-than 7d";
  };

  nix.settings = {
    auto-optimise-store = false;
  };

  programs.nix-index.enable = true;
}
