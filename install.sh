#!/bin/sh

echo "installing dotfiles..."

# Resolve the repo's own location so the scripts work from any clone path
DF="$(cd "$(dirname "$0")" && pwd)"

echo "initializing submodule(s)"
git -C "$DF" submodule update --init --recursive --jobs 8

# Install Homebrew or make sure it's up to date
which -s brew
if [[ $? != 0 ]] ; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew already installed. Updating..."
    brew update
fi

echo "No analytics..."
brew analytics off
export HOMEBREW_NO_ANALYTICS=1

echo "Installing packages, apps and VS Code extensions from Brewfile..."
brew bundle --file="$DF/Brewfile"

source "$DF/install/link.sh"
source "$DF/install/linkdirs.sh"
source "$DF/install/osx.sh"
source "$DF/install/iterm2.sh"
source "$DF/install/dock.sh"
source "$DF/install/fonts.sh"

# configuration for zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "configuring zsh as default shell..."
chsh -s $(which zsh)

echo "installation....DONE"
exit 0
