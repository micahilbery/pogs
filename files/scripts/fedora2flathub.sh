#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Remove Fedora Flatpak Repos and Flatpaks
flatpak remote-delete --system --force fedora
flatpak remote-delete --user --force fedora
flatpak remove --system --noninteractive --all
flatpak remove --user --noninteractive --all
flatpak remote-add --if-not-exists --system flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists --user flathub https://flathub.org/repo/flathub.flatpakrepo
