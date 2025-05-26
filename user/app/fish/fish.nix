{ config, pkgs, ... }:
{
  programs.fish = {
    enable = true;
    shellInit = ''
      set -U fish_user_paths \
	        $HOME/.local/bin
    '';          
  };
}
