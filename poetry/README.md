# Poetry Template

This flake ships poetry2nix for all your python needs with the below modifications

## Dev Shells

This flake by-default comes with a devShell which contains components for
`pre-commit`, common Nix tools among the RAD-Development team, the app itself,
and Poetry. All shells are packaged into the default shell which makes
`direnv` integration a breeze. Just install `direnv` run `direnv allow` and
everything else should build automatically from there. Please see
`shell.nix` for more info.

## `pre-commit` Integration

By default, this includes a number of useful checks for Nix, git, toml, json,
etc. Please see `checks.nix` for more info.

## Formatter configuration

Conforming to `RFC-166`, we automatically select `nixfmt-rfc-style` for
Nix formatting. Also included is `ruff` for Python formatting. Both can be
invoked at once using `treefmt`, which is packaged in the default devShell.

## Hydra configuration

Hydra support (for CI/CD) is automatically included via the `hydra/` folder.
However, cahnges need to be made to two files to use this.

- `inputs.nixexpr.{value,pulls,branches}` in `hydra/spec.json` all need to
   be changed to the correct repository.
- `repo` in `hydra/jobsets.nix` needs to be changed to the correct repository.
