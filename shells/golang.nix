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
  
   packages = with pkgs; [
      unstable.go
      unstable.gotools
      unstable.golangci-lint

      unstable.awscli2
      unstable.terraform
      unstable.tflint
      unstable.tfsec
      unstable.terraform-docs

      docker
      unstable.pre-commit
      docker-compose
   ];	

   shellHook = ''
      echo "Welcome to devenv, $USER 👋"
   '';
}
