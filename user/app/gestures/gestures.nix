{ config, pkgs, ... }:
{
  home.file.".config/libinput-gestures.conf".text = ''
    gesture swipe left 3 i3-msg workspace next
    gesture swipe right 3 i3-msg workspace prev
  '';
}
