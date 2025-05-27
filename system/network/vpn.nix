{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  # Reference: https://github.com/NixOS/nixpkgs/issues/213177#issuecomment-1905556283
  environment.systemPackages = [ pkgs.cloudflare-warp ]; # For 'warp-svc'.
  systemd.packages = [ pkgs.cloudflare-warp ]; # For 'warp-cli'.
  # Start 'warp-svc' service at startup.
  systemd.targets.multi-user.wants = [ "warp-svc.service" ];
  # Reference: https://developers.cloudflare.com/warp-client/get-started/linux/
  # First, register a new device, via 'warp-cli registration new'.
  # Now, one only need to do 'warp-cli connect' as an ordinary user.
}
