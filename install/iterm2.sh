#!/bin/sh

DF=$HOME/dotfiles

echo "iTerm2: load preferences from the dotfiles repo"
# Quit iTerm2 first so it doesn't overwrite the setting on exit
osascript -e 'tell application "iTerm2" to quit' 2>/dev/null

defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$DF/iterm2"
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
