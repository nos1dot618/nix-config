{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    pcmanfm
    yazi
    # trying out
    warp-terminal
  ];
}



