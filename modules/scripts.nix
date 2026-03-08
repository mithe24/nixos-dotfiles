{ pkgs, ... }:
{
    home.packages = [
        (pkgs.stdenv.mkDerivation {
            name = "scripts";
            src = ../config/scripts;
            buildPhase = "true";        # Skip makefile
            installPhase = ''
                mkdir -p $out/bin
                install -m755 *.sh $out/bin

                # strip .sh extensions
                for f in $out/bin/*.sh; do
                    mv "$f" "''${f%.sh}"
                done
            '';
        })
    ];
}
