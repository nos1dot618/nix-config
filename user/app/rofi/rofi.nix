{ config, pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    theme = "solarized_alternate";
  };
}
