{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    rofi
    rofi-bluetooth
    rofi-network-manager
  ];
  
  programs.rofi = {
    enable = true;
    theme = "solarized_alternate";
  };
}
