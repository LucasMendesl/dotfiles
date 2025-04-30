{ pkgs, ... }: {

   programs.kitty = {
     enable = true;   
     themeFile = "Molokai";

     settings = {
       font_size = 14;
       font_family = "Hack Nerd Font Regular";
       background_opacity = 0.9;
       background_blur = 22;
     };

     keybindings = {
       "cmd+ctrl+t" = "new_tab_with_cwd";
       "cmd+ctrl+w" = "close_other_tabs_in_os_window";
       "cmd+l" = "previous_tab";
       "cmd+r" = "next_tab";
     }; 
   };
}
