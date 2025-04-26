{ pkgs, ...  }:
{

   home.packages = with pkgs; [
      nil
      nixfmt-classic

      docker
      docker-compose		
   ];
}
