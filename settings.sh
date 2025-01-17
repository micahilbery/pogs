#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Install extras
cargo install atuin

# Change default shell to zsh
chsh -s $(which zsh)

# Change default dconf settings
gsettings set org.gnome.mutter experimental-features ['scale-monitor-framebuffer']
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.desktop.interface font-name="Inter Regular 12"
gsettings set org.gnome.desktop.interface document-font-name="Inter Regular 12"
gsettings set org.gnome.desktop.interface monospace-font-name="FiraCode Regular 18"
gsettings set org.gnome.wm.preferences titlebar-font "Inter Bold 12"
gsettings set org.gnome.shell favorite-apps ['org.gnome.Nautilus.desktop', 'org.gnome.Epiphany.desktop', 'code.desktop']
gsettings set org.gnome.shell enabled-extensions ['dash-to-dock@micxgx.gmail.com', 'blur-my-shell@aunetx']
gsettings set org.gtk.settings.file-chooser sort-directories-first true
gsettings set org.gtk.gtk4.settings.file-chooser sort-directories-first true
# Custom Key Bindings
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom0 binding '<Control><Shift>Escape'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom0 command "flatpak run io.missioncenter.MissionCenter"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom0 name 'mission-center'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom1 binding '<Control><Shift>e'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom1 command "flatpak run org.gnome.Characters"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom1 name 'characters'
# Default terminal theme
gsettings set org.gnome.Ptyxis interface-style 'system'
gsettings set org.gnome.Ptyxis restore-session false
gsettings set org.gnome.Ptyxis restore-window-size false
gsettings set org.gnome.Ptyxis audible-bell false
gsettings set org.gnome.Ptyxis profile-uuids ['2871e8027773ae74d6c87a5f659bbc74']
gsettings set org.gnome.Ptyxis default-profile-uuid '2871e8027773ae74d6c87a5f659bbc74'
gsettings set org.gnome.Ptyxis.Profiles.2871e8027773ae74d6c87a5f659bbc74 palette 'catppuccin-dynamic'
