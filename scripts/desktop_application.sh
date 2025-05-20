#!/usr/bin/env bash
set -xe

# Things, I do not want to do, but have to;
# until, I find a proper nix way to do it.

# Nix xdg.DesktopEntries create desktop entries inside
# nix profileDirectory instead of ~/.local/share/applications
ln -sf ~/.nix-profile/share/applications/idea-community.desktop \
   ~/.local/share/applications/idea-community.desktop
