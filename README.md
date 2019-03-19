# Nix configuration for building LaTeX documents

This repository contains the `nix` setup needed for building `LaTeX` documents
in a reproducible manner. It was inspired by the [IOHK formal
specifications](https://github.com/input-output-hk/cardano-ledger-specs).

## Building LaTeX documents

To build the latex document run:

```shell
nix-shell --pure --run make
```

The document can be built using `nix-build`. After running this command look
inside the `result` directory.

For a continuous compilation of the `LaTeX` file run:

```shell
nix-shell --pure --run "make watch"
```

## Adding packages

Most likely you will need other `LaTeX` packages. These can be added in the
`default.nix` file.

## Updating the nixpkgs version

Change this [`nix/nixpkgs-src.json`](nix/nixpkgs-src.json) to the desired
`nixpkgs` version by running:

```sh
nix-prefetch-git https://github.com/nixos/nixpkgs $version
```

and copying the resulting `rev` fields. In the snippet above $version will be
the desired `nixpkgs` version, e.g. `18.09`.
