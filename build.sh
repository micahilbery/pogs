#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Default packages

# Repositories
wget -P /etc/yum.repos.d/ https://copr.fedorainfracloud.org/coprs/dusansimic/themes/repo/fedora-40/dusansimic-themes-fedora-40.repo
wget -P /etc/yum.repos.d/ https://copr.fedorainfracloud.org/coprs/atim/starship/repo/fedora-40/atim-starship-fedora-40.repo

# Remove packages
rpm-ostree override remove \
firefox firefox-langpacks \
gnome-classic-session gnome-classic-session-xsession \
gnome-shell-extension-apps-menu gnome-shell-extension-background-logo \
gnome-shell-extension-launch-new-instance gnome-shell-extension-places-menu \
gnome-shell-extension-window-list \
gnome-system-monitor \
gnome-terminal gnome-terminal-nautilus \
gnome-tour \
yelp

# Install packages
rpm-ostree install \
cargo \
eza \
ffmpeg \
fira-code-fonts \
git \
gh \
glab \
gnome-shell-extension-dash-to-dock \
gnome-shell-extension-blur-my-shell \
morewaita-icon-theme \
nodejs \
nodejs-npm \
ptyxis \
rsms-inter-fonts \
starship \
thefuck \
util-linux \
zoxide \
zsh \
zsh-autosuggestions \
zsh-syntax-highlighting

cat /tmp/flatpaks_install | while read line; do flatpak install --system --noninteractive flathub $line; done
cat /tmp/flatpaks_uninstall | while read line; do flatpak uninstall --system --noninteractive $line; done

systemctl enable dconf-update.service
systemctl --global enable pogs-flatpak-manager.service
