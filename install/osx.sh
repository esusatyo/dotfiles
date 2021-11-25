#!/bin/sh

# Close any open System Preferences panes,
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "Finder: show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "Finder: show the ~/Library folder"
chflags nohidden ~/Library

echo "Finder: show Path bar"
defaults write com.apple.finder ShowPathbar -bool true

echo "Finder: show Status bar"
defaults write com.apple.finder ShowStatusBar -bool true

echo "killing affected applications"
for app in Finder Dock SystemUIServer; do killall "$app" >/dev/null 2>&1; done
