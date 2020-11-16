# Nix configuration for building LaTeX documents

This repository contains instructions and a `nix` setup needed for building
`LaTeX` documents in a reproducible manner.

## Building LaTeX documents

To build the latex document run:

```shell
nix-shell --run make
```

The document can be built using `nix-build`. After running this command look
inside the `result` directory.

For a continuous compilation of the `LaTeX` file run:

```shell
nix-shell --run "make watch"
```

## Adding packages

Most likely you will need other `LaTeX` packages. These can be added in the
`default.nix` file.

Note that when adding a new package, it might be necessary to run:

```shell
nix-shell --run "make clean"
```

## Managing versions using niv

The first step towards reproducible builds is specifying which package versions
we need. This process is greatly simplified by
[`niv`](https://github.com/nmattia/niv). Make sure you install it using nix to
manage the `nixpkgs` versions as well as other sources you need to pin.

## Improve your workflow further by using lorri

If you install and configure [`lorri`](https://github.com/target/lorri) then it
is not necessary to use the `nix-shell` command, and one can use `make`
directly. See the project documentation for details on how to use it.
