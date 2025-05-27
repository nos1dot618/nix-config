{ pkgs, ... }:
{
  # Packages; that are either temporary or I am trying out
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    warp-terminal
  ];
}
