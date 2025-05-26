{ config, pkgs, ... }:
{
  services.libinput.touchpad = {
    tapping = true;
    naturalScrolling = true;
    scrollMethod = "twofinger";
    tappingButtonMap = "lrm";
  };
}
