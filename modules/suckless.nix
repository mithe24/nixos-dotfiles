{ pkgs, ... }:

{
    home.packages = with pkgs; [
        (pkgs.st.overrideAttrs (old: {
                src = ../config/st;
                nativeBuildInputs = old.nativeBuildInputs ++ [
                    pkgs.pkg-config
                ];
            buildInputs = old.buildInputs ++ [
                pkgs.harfbuzz
                pkgs.freetype
                pkgs.fontconfig
            ];
            patches = [ ];
        }))
        (pkgs.dmenu.overrideAttrs (_: {
            src = ../config/dmenu;
            patches = [ ];
        }))
        (pkgs.dwmblocks.overrideAttrs (_: {
            src = ../config/dwmblocks;
            patches = [ ];
        }))
        slock
    ];
}
