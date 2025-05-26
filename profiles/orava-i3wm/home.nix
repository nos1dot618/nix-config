{ config, pkgs, ... }:
{

  imports = [
    ../../user/app/gestures/gestures.nix
    ../orava/home.nix
    ../../user/app/i3/i3.nix
    ../../user/app/i3status/i3status.nix
  ];

  home.sessionPath = [
    "$HOME/.local/bin"
  ];
}
