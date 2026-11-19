{
  pkgs,
  lib,
  ...
}: let
  texlive = pkgs.texlive.withPackages (ps: [ps.latexindent]);
in {
  settings.formatter.latexindent = {
    # latexindent requires a backup for in-place writes; keep it and the log in scratch space.
    command = lib.mkDefault (toString (pkgs.writeShellScript "treefmt-latexindent" ''
      set -eu
      scratch=$(${pkgs.coreutils}/bin/mktemp -d)
      trap '${pkgs.coreutils}/bin/rm -rf -- "$scratch"' EXIT
      ${texlive}/bin/latexindent -wd -s -c "$scratch/" -- "$@"
    ''));
    includes = ["*.tex" "*.sty" "*.cls" "*.bib"];
  };
}
