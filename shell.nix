{ pkgs  ? import <nixpkgs> {} }: 
pkgs.mkShell {
  buildInputs = [
    pkgs.python313
    pkgs.python313Packages.pip
    pkgs.python313Packages.uv
    pkgs.python313Packages.venvShellHook
  ];
  env.LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
    pkgs.stdenv.cc.cc.lib
    pkgs.zstd
  ];
  venvDir = "./.venv";
  postShellHook = ''
    uv tool install zmk
  '';
  shellHook = ''
    export PATH=$PATH:~/.local/bin
  '';
}
