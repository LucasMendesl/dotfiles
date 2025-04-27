{ pkgs, lib, ... }: 
{
  home.packages = [ pkgs.zplug ];

  programs.zsh = {
    enable = true;

    enableCompletion = true;

    history = {
      append = true;

      size = 5000;
      save = 5000;
      
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;    
    };

    defaultKeymap = "emacs";

    initExtra = ''
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

HISTDUP=erase

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
    '';

    initExtraBeforeCompInit = ''
export ZINIT_HOME="${pkgs.zinit}/share/zinit"

# Source/Load zinit
source "${pkgs.zinit}/share/zinit/zinit.zsh"

bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

echo "Hello, $USER"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light hlissner/zsh-autopair
zinit light MichaelAquilina/zsh-you-should-use
zinit light junegunn/fzf
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

zinit cdreplay -q
    '';
    
   completionInit = ''
autoload -Uz compinit && compinit
'';

  };
}
