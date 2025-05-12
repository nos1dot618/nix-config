{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    emacs
    fish
    git
    floorp
    tmux
    htop
    home-manager
    wl-clipboard
  ];
}
