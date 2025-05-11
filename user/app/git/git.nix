{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "ninthcircle";
    userEmail = "mainlakshayhoon@gmail.com";
    signing.key = "~/Keys/gitlab/gitlab_id_ed25519";
  };
}
