{ pkgs ? import (import nix/fetch-nixpkgs.nix) {}
}:

with pkgs;

stdenv.mkDerivation {
  name = "LaTeX-env";
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
