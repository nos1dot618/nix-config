{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "ninthcircle";
    userEmail = "mainlakshayhoon@gmail.com";
    signing = {
      format = "ssh";
      key = "~/Keys/gitlab/gitlab_id_ed25519.pub";
      signByDefault = true;
    };
  };
}
