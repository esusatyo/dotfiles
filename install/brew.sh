#!/bin/sh

# Install Homebrew or make sure it's up to date
which -s brew
if [[ $? != 0 ]] ; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew already installed. Updating..."
    brew update
    brew upgrade
fi

echo "No analytics..."
brew analytics off
export HOMEBREW_NO_ANALYTICS=1

echo "Installing Homebrew packages..."
brew install clang-format           # format C/C++ and protobuf files
brew install cmake                  # cross platform build system
brew install ctag                   # index lang objects for vim
brew install fzf                    # fuzzy searching
brew install htop                   # process viewer
brew install youtube-dl				# youtube utility
brew install mas					# mac app store 

echo "Installing development tools..."
brew install git                    # keep git updated with homebrew
brew install go                     # Go programing language
brew install node                   # Node.js and npm
brew install python                 # Python 3 and pip
brew install zsh                    # the only shell you need
brew install github/gh/gh           # GitHub CLI

# configuration for zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

pip3 install pynvim                 # required for fzf.vim plugin

echo "Installing casks..."
brew install cask docker 	        # *nix containers
brew install cask 1password	        # password manager
brew install cask dropbox           # shared files
brew install cask aerial            # screensaver
brew install cask zoom				# zoom video conferencing
brew install cask fork				# source control
brew install cask sourcetree		# source control
brew install cask istat-menus		# system monitoring app
brew install cask textmate			# text editor
brew install cask karabiner-elements	# keyboard customiser
brew install cask google-drive		# client for google drive
brew install cask visual-studio-code	# vscode
brew install cask google-chrome		# web browser
brew install cask alfred	# productivity app


echo "Cleanup..."
brew cleanup
