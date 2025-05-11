{ config, pkgs, ... }: 
{
  programs.emacs = {
    enable = true;
  };
  xdg.configFile."emacs/init.el".source = ./init.el;
  xdg.configFile."emacs/custom.el".source = ./custom.el;
  xdg.configFile."emacs/lsp.el".source = ./lsp.el;
  # NOTE: Emacs will only try to sense `~/.config/emacs/`,
  #       when there is no `~/.emacs` and `~/.emacs.d/`.
}
