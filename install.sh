#!/bin/bash

GITHUB_REPO_PATH=${GITHUB_REPO_PATH:-lucasmendesl/dotfiles}
HOSTNAME=${HOSTNAME:-$(scutil --get LocalHostName)}
GIT_CLONE_LOCAL_PATH=${GIT_CLONE_LOCAL_PATH:-$HOME/.dotfiles}

echo "fetching git dotfiles repository"
nix-shell -p git --run 'git clone https://github.com/${GITHUB_REPO_PATH} ${GIT_CLONE_LOCAL_PATH}'

echo "Installing nix darwin..."
nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake "./darwin#${HOSTNAME}"


