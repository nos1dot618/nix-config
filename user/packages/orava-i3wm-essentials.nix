{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pcmanfm
    yazi
  ];
}
