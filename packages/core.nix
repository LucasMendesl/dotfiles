{ pkgs, ...  }:
{

   home.packages = with pkgs; [
      nil
      nixfmt-classic

      unstable.devenv 	
      docker
      docker-compose		
   ];

   programs.fzf = {
     enable = true;
     enableZshIntegration = true;  
   };

   programs.fd = {
     enable = true;	
   };

   programs.eza = {
     enable = true;
     enableZshIntegration = true;
   };

   programs.bat = {
     enable = true;
   };

   programs.zoxide = {
     enable = true;
     enableZshIntegration = true;  
   };
}
