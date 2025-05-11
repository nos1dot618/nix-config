{ pkgs, ... }:
{
  home.packages = with pkgs; [
    clang
    gnumake
    cmake
    autoconf
    automake
    libtool
    # NOTE: clangd comes packged in clang-tools
    clang-tools
  ];
}

