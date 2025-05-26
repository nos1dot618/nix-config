{ config, pkgs, ... }:
{
  xdg.enable = true;
  xdg.desktopEntries = {
    rofi-settings = {
      name = "Nucleus";
      genericName = "nucleus";
      exec = ".local/bin/nucleus";
      icon = "settings";
      type = "Application";
      categories = [ "Settings" "Utility" ];
    };
  };

  home.file.".local/bin/nucleus" = {
    source = ../../scripts/nucleus.sh;
    executable = true;
  };
}
