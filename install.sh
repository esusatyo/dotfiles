#!/bin/sh

echo "installing dotfiles..."

DF=$HOME/dotfiles

echo "initializing submodule(s)"
git submodule update --init --recursive --jobs 8

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

source ./install/link.sh
source ./install/linkdirs.sh
source ./install/osx.sh
source ./install/iterm2.sh
source ./install/dock.sh
source ./install/fonts.sh

# configuration for zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "configuring zsh as default shell..."
chsh -s $(which zsh)

echo "installation....DONE"
exit 0
