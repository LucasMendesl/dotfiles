#!/bin/bash

# GITHUB_REPO_PATH=$1

echo "checking if nix is present in system..."

if ! which -s nix; then
    # Install Nix
    echo "Nix not installed, installing now..."
    URL="https://nixos.org/nix/install"
    CONFIGURATION="
extra-experimental-features = nix-command flakes
extra-trusted-users = ${USER}
    "
    sh <(curl --location "${URL}") \
        --nix-extra-conf-file <(echo "${CONFIGURATION}")
else
   echo "Nix already installed, following with the next steps" 
fi

# WHEN WE HAVE THE CONFIGURATION SETTED UP, FETCH FROM GIT REPOSITORY
# echo "fetching git dotfiles repository"
# nix-shell -p git --run 'git clone https://github.com/${GITHUB_REPO_PATH} ~/.dotfiles'

echo "Installing nix darwin..."
HOSTNAME=${HOSTNAME:-mbp-i5-lucas}
nix run nix-darwin -- switch --flake "./#${HOSTNAME}"
