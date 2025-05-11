{ config, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    keyMode = "emacs";
    mouse = true;
    shell = "${pkgs.fish}/bin/fish";
    extraConfig = ''
      # Automatically copy to clipboard on selection (Wayland)
      bind-key -T copy-mode MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "wl-copy"
      # Copy to clipboard (Wayland)
      bind-key -T copy-mode Enter send-keys -X copy-pipe-and-cancel "wl-copy"
      # Clear history with Ctrl-k
      bind -n C-k clear-history
    '';
  };
}
