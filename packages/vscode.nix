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
      "terminal.integrated.fontFamily" = "Hack Nerd Font";
      "terminal.external.osxExec" = "Kitty.app";
      "terminal.integrated.defaultProfile.osx" = "zsh";
      "go.toolsManagment.autoUpdate" = true;
      "database-client.autoSync" = true;
      "github.copilot.nextEditSuggestions.enabled" = true;
    };

    extensions = with pkgs; [
      vscode-extensions.golang.go
      vscode-extensions.hashicorp.hcl
      vscode-extensions.github.copilot
      vscode-extensions.ms-python.python
      vscode-extensions.jnoortheen.nix-ide
      vscode-extensions.hashicorp.terraform
      vscode-extensions.ms-vscode.live-server
      vscode-extensions.kddejong.vscode-cfn-lint
      vscode-extensions.editorconfig.editorconfig
      vscode-extensions.github.vscode-github-actions
      vscode-marketplace.monokai.theme-monokai-pro-vscode
      vscode-marketplace.chadalen.vscode-jetbrains-icon-theme
      vscode-marketplace.bmewburn.vscode-intelephense-client
      vscode-marketplace.xdebug.php-debug
      vscode-marketplace.bradlc.vscode-tailwindcss
      vscode-marketplace.sonarsource.sonarlint-vscode
      vscode-marketplace.quicktype.quicktype
      vscode-marketplace.cweijan.dbclient-jdbc
      vscode-marketplace.github.copilot-chat
      vscode-marketplace.ms-azuretools.vscode-docker
      vscode-marketplace.eamodio.gitlens
      vscode-marketplace.hbenl.vscode-test-explorer
      vscode-marketplace.donjayamanne.githistory
      vscode-marketplace.wayou.vscode-todo-highlight
      vscode-marketplace.cweijan.vscode-mysql-client2
      vscode-marketplace.postman.postman-for-vscode
    ];
  };
}
