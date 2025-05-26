{ config, pkgs, ... }:
{

  imports = [
    ../orava/home.nix
    ../../user/app/gestures/gestures.nix
    ../../user/app/i3/i3.nix
    ../../user/app/i3status/i3status.nix
    ../../user/packages/orava-i3wm-essentials.nix
  ];

  home.sessionPath = [
    "$HOME/.local/bin"
  ];
}
