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

  home.packages = with pkgs; [
    unstable.kubectl
    unstable.nil
    unstable.awscli2
    unstable.nixfmt-classic
    #unstable.oci-cli
    #unstable.terraform
    unstable.nodejs_23
    unstable.jq
    unstable.go
    unstable.gotools
    unstable.golangci-lint
    unstable.pre-commit
    unstable.claude-code
  ];

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fd = { enable = true; };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.bat = { enable = true; };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
