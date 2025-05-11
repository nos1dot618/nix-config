{ config, pkgs, ... }:
{  
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "gitlab.com" = {
        hostname = "gitlab.com";
        user = "git";
        identityFile = "~/Keys/gitlab/gitlab_id_ed25519";
      };
      "codeberg.org" = {
        hostname = "codeberg.org";
        user = "git";
        identityFile = "~/Keys/codeberg/codeberg_id_ed25519";
      };
    };
  };
}
