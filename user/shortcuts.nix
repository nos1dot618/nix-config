{ config, pkgs, ... }:
{
  xdg.enable = true;
  xdg.desktopEntries = {
    idea-community = {
      name = "IntelliJ IDEA Community";
      genericName = "Java IDE";
      comment = "The IDE for Java and other JVM languages";
      exec = "idea-community";
      icon = "idea-community";
      terminal = false;
      categories = [ "Development" "IDE" ];
    };
    moonmoon = {
      name = "MoonMoon Bluetooth Utility";
      genericName = "MoonMoon";
      exec = "bash .local/bin/moonmoon";
      icon = "bluetooth";
      type = "Application";
      categories = [ "Settings" "Utility" ];
    };
  };

  home.file.".local/bin/moonmoon" = {
    source = ../scripts/moonmoon.sh;
    executable = true;
  };
}
