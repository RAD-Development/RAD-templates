{
  self,
  inputs,
  checks,
  system,
  ...
}:

let
  inherit (inputs) nixpkgs;
  pkgs = nixpkgs.legacyPackages.${system};

  # construct the shell provided by pre-commit for running hooks
  pre-commit = pkgs.mkShell {
    inherit (checks.pre-commit-check) shellHook;
    buildInputs = checks.pre-commit-check.enabledPackages;
  };

  # constructs a custom shell with commonly used utilities
  rad-dev = pkgs.mkShell {
    packages = with pkgs; [
      deadnix
      pre-commit
      treefmt
      statix
      nixfmt-rfc-style
    ];
  };

  # constructs the application in-place
  app = pkgs.mkShell { inputsFrom = [ self.packages.${system}.myapp ]; };

  # pull in python/poetry dependencies
  poetry = pkgs.mkShell { packages = [ pkgs.poetry ]; };
in
{
  default = pkgs.mkShell {
    inputsFrom = [
      pre-commit
      rad-dev
      app
      poetry
    ];
  };
}
