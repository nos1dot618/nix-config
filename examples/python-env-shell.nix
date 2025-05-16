let
  pkgs = import <nixpkgs> {
    config.allowUnfree = true;
  };
  
  # Python LSP related packages
  python-lsp-server-all = ps: with ps; [
    python-lsp-server
    # Extras equivalent to [all]
    python-lsp-black
    # pylsp-mypy # type checks
    pylsp-rope
    autopep8
    # flake8
    # mccabe
    # pycodestyle
    # pydocstyle
    # pyflakes
    yapf
    isort
    rope
  ];

  python-with-packages = pkgs.python3.withPackages (ps: with ps; [
    # Add python packages here, for example:
    # pandas
    # matplotlib
    # termcolor
  ] ++ (python-lsp-server-all ps));
in
pkgs.mkShell {
  buildInputs = [
    python-with-packages
    # Add other packages here, for example:
    # pkgs.anydesk
    # pkgs.tk
  ];

  # This is important to do, as it provides C runtime for packages
  env.LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
    pkgs.stdenv.cc.cc.lib
    pkgs.libz
  ];
}
