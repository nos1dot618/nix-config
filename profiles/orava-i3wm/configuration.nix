{ config, pkgs, ... }:
{
  imports = [
    ../orava/configuration.nix
    ../../system/devices/touchpad.nix
  ];

  # Reference: https://nixos.wiki/wiki/I3
  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
  };
  services.displayManager = {
    defaultSession = "none+i3";
  };
  
  # Disable legacy pulseaudio service
  services.pulseaudio.enable = false;
  # PipeWire setup
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;  # Provides pactl/paplay via pipewire-pulse
    # jack.enable = true;  # Optional, if you need JACK
  };
  security.rtkit.enable = true;

  environment.systemPackages = with pkgs; [
    light # brightness control
  ];

}
