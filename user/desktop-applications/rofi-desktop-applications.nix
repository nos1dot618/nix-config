{ config, pkgs, ... }:
{
  xdg.enable = true;
  xdg.desktopEntries = {
    moonmoon = {
      name = "MoonMoon Bluetooth Utility";
      genericName = "MoonMoon";
      exec = ".local/bin/moonmoon";
      icon = "bluetooth";
      type = "Application";
      categories = [ "Settings" "Utility" ];
    };
    rofi-settings = {
      name = "Rofi Settings";
      genericName = "rofi-settings";
      exec = ".local/bin/rofi-settings";
      icon = "settings";
      type = "Application";
      categories = [ "Settings" "Utility" ];
    };
  };

  home.file.".local/bin/moonmoon" = {
    source = ../../scripts/moonmoon.sh;
    executable = true;
  };
  
  home.file.".local/bin/rofi-settings" = {
    source = ../../scripts/rofi-settings.sh;
    executable = true;
  };
}
