#!/bin/sh

# Rebuild the Dock to match the current machine.
# Requires dockutil (installed via the Brewfile).

echo "Configuring Dock..."

dockutil --remove all --no-restart

dockutil --add "/Applications/Safari Technology Preview.app" --no-restart
dockutil --add "/Applications/Google Chrome.app" --no-restart
dockutil --add "$HOME/Applications/Google Calendar.app" --no-restart
dockutil --add "$HOME/Applications/Google Maps.app" --no-restart
dockutil --add "/System/Applications/iPhone Mirroring.app" --no-restart
dockutil --add "/Applications/Visual Studio Code.app" --no-restart
dockutil --add "/System/Applications/System Settings.app" --no-restart
dockutil --add "/System/Applications/Utilities/Activity Monitor.app" --no-restart

dockutil --add "$HOME/Downloads" --display stack --view fan --no-restart

killall Dock
