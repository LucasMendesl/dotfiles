{ pkgs, ... }: {
  
   programs.vscode = {
      enable = true;
       
      userSettings = {
         "workbench.colorTheme" = "Monokai Pro";
         "workbench.iconTheme" = "vscode-jetbrains-icon-theme-2023-auto";
         "editor.fontSize" = 16;
         "editor.formatOnPaste" = true;
         "editor.formatOnSave" = true;
         "terminal.integrated.fontSize" = 14;
      };

      extensions = with pkgs; [
        vscode-extensions.golang.go
        vscode-extensions.hashicorp.hcl
        vscode-extensions.github.copilot
        vscode-extensions.ms-python.python
        vscode-extensions.redhat.vscode-yaml
        vscode-extensions.jnoortheen.nix-ide
        vscode-extensions.hashicorp.terraform
        vscode-extensions.github.copilot-chat
        vscode-extensions.ms-vscode.live-server
        vscode-extensions.tamasfe.even-better-toml
        vscode-extensions.kddejong.vscode-cfn-lint
        vscode-extensions.devsense.phptools-vscode
        vscode-extensions.editorconfig.editorconfig
        vscode-extensions.github.vscode-github-actions
        vscode-extensions.jgclark.vscode-todo-highlight
        vscode-extensions.streetsidesoftware.code-spell-checker
      ];

   }; 
}
