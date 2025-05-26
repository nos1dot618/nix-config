{ config, pkgs, ... }:
{
  programs.i3status = {
    enable = true;
    general = {
      output_format = "i3bar";
      colors = true;
      markup = "pango";
      interval = 5;
    };
    modules = {
      "cpu_temperature 0" = {
        position = 1;
        settings = {
          format = "<span foreground='#d12f2c' font_weight='bold'>Temp: %degrees°C</span>";
          path = "/sys/class/thermal/thermal_zone0/temp";
        };
      };
      "volume master" = {
        position = 2;
        settings = {
          format = "<span foreground='#f984e5' font_weight='bold'>Volume: %volume</span>";
          format_muted = "<span foreground='#f984e5' font_weight='bold'>Volume: Muted</span>";
          device = "default";
          mixer = "Master";
          mixer_idx = 0;
        };
      };
      "wireless _first_" = {
        position = 3;
        settings = {
          format_up = "<span foreground='#93dc5c' font_weight='bold'>W:%quality at %essid, IP: %ip</span>";
          format_down = "<span foreground='#d12f2c' font_weight='bold'>W: Down</span>";
        };
      };
      # This device does not ethernet port,
      # thus this does not make sense to enable
      "ethernet _first_" = {
        enable = false;
      };     
      "battery all" = {
        position = 4;
        settings = {
          last_full_capacity = true;
          format = "<span foreground='#ffa500' font_weight='bold'>Battery: %status %percentage</span>";
          format_down = "Battery: NA";
          path = "/sys/class/power_supply/BAT%d/uevent";
          low_threshold = 10;
          integer_battery_capacity = true;
        };
      };
      "disk /" = {
        position = 5;
        settings = {
          format = "<span foreground='#93dc5c' font_weight='bold'>Disk: %avail</span>";
        };
      };
      "memory" =  {
        position = 6;
        settings = {
          format = "<span foreground='#d12f2c' font_weight='bold'>RAM: %used:%available</span>";
          threshold_degraded = "1G";
          format_degraded = "MEMORY < %available";
        };
      };
      "tztime local" =  {
        position = 7;
        settings = {
          format = "<span foreground='#e5e5e5' font_weight='bold'>%Y-%m-%d %H:%M:%S</span>";
        };
      };
      "load" = {
        enable = false;
      };
    };
  };
}
