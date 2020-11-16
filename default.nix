{ sources ? import ./nix/sources.nix # See: https://github.com/nmattia/niv and https://nix.dev/tutorials/towards-reproducibility-pinning-nixpkgs.html#dependency-management-with-niv
, pkgs ? import sources.nixpkgs {}   # Use the pinned sources.
}:

with pkgs;

stdenv.mkDerivation {
  name = "mydoc";
  buildInputs = [ (texlive.combine {
                    inherit (texlive)
                      scheme-small

                      # Add other LaTeX libraries (packages) here as needed, e.g:
                      # stmaryrd amsmath pgf

                      # build tools
                      latexmk
                      ;
                  })

                ];
  src = ./.;
  buildPhase = "make";

  meta = with lib; {
    description = "Describe your document here";
    license = licenses.bsd3;
    platforms = platforms.linux;
  };
}
