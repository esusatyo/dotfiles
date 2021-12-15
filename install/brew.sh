#!/bin/sh

# Install Homebrew or make sure it's up to date
which -s brew
if [[ $? != 0 ]] ; then
    echo "Homebrew not found. Installing Homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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
brew cask install docker 	        # *nix containers
brew cask install 1password	        # password manager
brew cask install dropbox           # shared files
brew cask install aerial            # screensaver
brew cask install zoom				# zoom video conferencing
brew cask install fork				# source control
brew cask install sourcetree		# source control
brew cask install istat-menus		# system monitoring app
brew cask install textmate			# text editor
brew cask install karabiner-elements	# keyboard customiser
brew cask install google-drive		# client for google drive
brew cask install visual-studio-code	# vscode
brew cask install google-chrome		# web browser


echo "Cleanup..."
brew cleanup
