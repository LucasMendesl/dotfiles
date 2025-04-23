{
  lib,
  username,
  useremail,
  ...
}: {

  programs.git = {
    enable = true;
    lfs.enable = true;    

    userName = username;
    userEmail = useremail;

    delta = {
      enable = true;
      options = {
        features = "side-by-side";
      };
    };
    
    extraConfig = {
      column = {
        ui = "auto";
      };
      diff = {
        algorithm = "histogram";
        tool = "difftastic";
        context = 10;
        colorMoved = "default";
      };
      init = {
        defaultBranch = "main";
      };
      branch = {
        sort = "-commiterdate";
      };
      tag = {
        sort = "version:refname";
      };
      merge = {
        conflictstyle = "zdiff3";
        keepbackup = false;
      };
      pull = {
        rebase = true;
      };
      push = {
        default = "simple";
        autoSetupRemote = true;
        followTags = true;
      };
      rebase = {
        autosquash = true;
        autostash = true;
        updaterefs = true;
      };
      rerere = {
        enabled = true;
        autoupdate = true;
      };
      core = {
        editor = "vim";
        excludesFile = "~/.gitignore";
      };
      commit = {
        verbose = true;
        cleanup = "scissors"; 
      };
      credential = {
        helper = "osxkeychain";
      };
      fetch = {
        prune = true;
        pruneTags = true;
        all = true;
      };
      help = {
        autocorrect = "prompt";
      };
    };
    ignores = [
      "node_modules"
      ".env"
      ".direnv/"
      ".envrc"
      ".DS_Store"
    ];

  };
}
