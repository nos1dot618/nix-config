{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jetbrains.idea-community
    openjdk
    fastfetch
    zola
    vscodium-fhs
    gnupg
    pinentry-curses # required for gnupg
    tree
    kdePackages.kate
    wget
  ];
}

