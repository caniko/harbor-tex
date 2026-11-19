{harbor-meta}: _: {
  imports = [
    harbor-meta.treefmtModules.nix
    harbor-meta.treefmtModules.toml
    ./treefmt/latex.nix
  ];
  projectRootFile = "flake.nix";
  settings.excludes = [
    "templates/**"
    "fixtures/**"
    "tests/fixtures/**"
    "checks/fixtures/**"
    ".github/workflows/*.yaml"
  ];
}
