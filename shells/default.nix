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
in pkgs.mkShell {

  packages = with pkgs; [ unstable.fn-cli ];

  shellHook = ''
    echo "Welcome to devenv, $USER 👋"
  '';
}
