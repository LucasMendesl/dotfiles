{ pkgs, ... }: {

  environment.extraInit = ''
export PATH=$HOME/bin:$PATH
  '';

  environment.systemPackages = with pkgs; [
    #git
    tree
    #neovim 
    #vscode
    #colima
    #docker
    #docker-compose
  ];

  #environment.variables.EDITOR = "nvim";
  programs.zsh.enable = true;  
}
