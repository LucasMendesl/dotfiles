#!/bin/bash

GITHUB_REPO_PATH=${GITHUB_REPO_PATH:-lucasmendesl/dotfiles}
HOSTNAME=${HOSTNAME:-$(scutil --get LocalHostName)}
GIT_CLONE_LOCAL_PATH=${GIT_CLONE_LOCAL_PATH:-$HOME/.dotfiles}

echo "checking if nix is present in system..."

if ! which -s nix; then
    # Install Nix
    echo "Nix not installed, installing now..."
    URL="https://nixos.org/nix/install"
    sh <(curl --location "${URL}")

    exec $SHELL
else
   echo "Nix already installed, following with the next steps" 
fi

# WHEN WE HAVE THE CONFIGURATION SETTED UP, FETCH FROM GIT REPOSITORY
# echo "fetching git dotfiles repository"
# nix-shell -p git --run 'git clone https://github.com/${GITHUB_REPO_PATH} ${GIT_CLONE_LOCAL_PATH}'

echo "Installing nix darwin..."
nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake "./#${HOSTNAME}"


