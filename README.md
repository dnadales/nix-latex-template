# Nix configuration for building LaTeX documents

This repository contains instructions and a `nix` setup needed for building
`LaTeX` documents in a reproducible manner.

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

Note that when adding a new package, it might be necessary to run:

```shell
nix-shell --pure --run "make clean"
```

## Managing versions using niv

The first step towards reproducible builds is specifying which package versions
we need. This process is greatly simplified by
[`niv`](https://github.com/nmattia/niv). Make sure you install it using nix to
manage the `nixpkgs` versions as well as other sources you need to pin.
