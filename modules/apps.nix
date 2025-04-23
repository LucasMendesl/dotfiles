{ pkgs, ... }: {

  environment.extraInit = ''
export PATH=$HOME/bin:$PATH
  '';

  environment.systemPackages = with pkgs; [
    git
    tree 
    vscode
    kitty
    colima
    google-chrome    
  ];

  environment.variables.EDITOR = "vim";
  programs.zsh.enable = true;  
}
