{ config, pkgs, ... }:
{

  imports = [
    ../orava/home.nix
    ../../user/app/gestures/gestures.nix
    ../../user/app/i3/i3.nix
    ../../user/app/i3status/i3status.nix
    ../../user/app/rofi/rofi.nix    
    ../../user/desktop-applications/nucleus-desktop-applications.nix
    ../../user/packages/orava-i3wm-essentials.nix
    ../../user/packages/temporary-packages.nix
  ];

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  # TODO: This does not work, fix this 
  xdg.mimeApps.defaultApplications = {
    "inode/directory" = "pcmanfm.desktop";
  };
}
