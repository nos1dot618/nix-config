{ config, pkgs, ... }:
let
  mod = "Mod4";
in {
  home.packages = with pkgs; [
    # audio
    alsa-utils
    pavucontrol
    pulseaudio
    # wallpaper
    nitrogen
    # gestures
    libinput-gestures
    xdotool
    # playback
    playerctl
  ];
  
  # Reference: https://nixos.wiki/wiki/I3
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      modifier = mod;
      fonts = {
        size = 11.0;
      };
      bars = [
        {
          statusCommand = "i3status";
          fonts = {
            size = 11.0;
          };
        }
      ];
      gaps = {
        inner = 0;
        outer = 0;
      };
      
      startup = [
        { command = "pulseaudio"; }
        { command = "nitrogen --restore"; }
        { command = "libinput-gestures -v"; }
      ];
      
      keybindings = {
        "${mod}+q" = "kill";
        "${mod}+d" = "exec rofi -show drun";
        "${mod}+e" = "exec emacs";
        "${mod}+b" = "exec floorp";
        "${mod}+p" = "exec pcmanfm";
        "${mod}+w" = "layout tabbed";
        "${mod}+a" = "exec rofi-settings";
        "${mod}+f" = "fullscreen";
        "${mod}+Return" = "exec konsole";
        "${mod}+Shift+space" = "floating toggle";
        "${mod}+Shift+c" = "reload";
        "${mod}+Shift+r" = "restart";
        # Change focus
        "${mod}+j" = "focus left";
        "${mod}+k" = "focus down";
        "${mod}+l" = "focus up";
        "${mod}+semicolon" = "focus right";
        "${mod}+Left" = "focus left";
        "${mod}+Down" = "focus down";
        "${mod}+Up" = "focus up";
        "${mod}+Right" = "focus right";
        # Move focused window
        "${mod}+Shift+j" = "move left";
        "${mod}+Shift+k" = "move down";
        "${mod}+Shift+l" = "move up";
        "${mod}+Shift+semicolon" = "move right";
        "${mod}+Shift+Left" = "move left";
        "${mod}+Shift+Down" = "move down";
        "${mod}+Shift+Up" = "move up";
        "${mod}+Shift+Right" = "move right";
        # Switch to workspace
        "${mod}+1" = "workspace 1";
        "${mod}+2" = "workspace 2";
        "${mod}+3" = "workspace 3";
        "${mod}+4" = "workspace 4";
        "${mod}+5" = "workspace 5";
        "${mod}+6" = "workspace 6";
        "${mod}+7" = "workspace 7";
        "${mod}+8" = "workspace 8";
        "${mod}+9" = "workspace 9";
        "${mod}+0" = "workspace 10";
        # Move focused container to workspace
        "${mod}+Shift+1" = "move container to workspace 1";
        "${mod}+Shift+2" = "move container to workspace 2";
        "${mod}+Shift+3" = "move container to workspace 3";
        "${mod}+Shift+4" = "move container to workspace 4";
        "${mod}+Shift+5" = "move container to workspace 5";
        "${mod}+Shift+6" = "move container to workspace 6";
        "${mod}+Shift+7" = "move container to workspace 7";
        "${mod}+Shift+8" = "move container to workspace 8";
        "${mod}+Shift+9" = "move container to workspace 9";
        "${mod}+Shift+0" = "move container to workspace 10";
        # pipewire/audio-volume
        "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
        "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
        "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
        # brightness
        "XF86MonBrightnessUp" = "exec sudo light -A 5";
        "XF86MonBrightnessDown" = "exec sudo light -U 5";
        # playerctl
        "XF86AudioPlay" = "exec playerctl play-pause";
        "XF86AudioNext" = "exec playerctl next";
        "XF86AudioPrev" = "exec playerctl previous";
      };
    };
  };
}
