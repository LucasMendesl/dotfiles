{ pkgs, ...  }:
{

   home.packages = with pkgs; [
      nil
      nixfmt-classic

      docker
      docker-compose		
   ];

   programs.fzf = {
     enable = true;
     enableZshIntegration = true;  
   };
}
