{ inputs, system, ... }:
let
  unstable-overlay = final: prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = prev.system;
      config.allowUnfree = true;
    };
  };
  pkgs = import inputs.nixpkgs {
    inherit system;
    overlays = [ unstable-overlay ];
    config.allowUnfree = true;
  };
in {
  environment.extraInit = ''
    export PATH=$HOME/bin:$PATH
  '';

  environment.systemPackages = with pkgs; [
    git
    tree
    vscode
    kitty
    unstable.colima
    unstable.docker
    unstable.kind
    unstable.docker-compose
    unstable.google-chrome
  ];

  environment.variables.EDITOR = "vim";
  programs.zsh.enable = true;
}
