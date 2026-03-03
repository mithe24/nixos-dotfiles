{ pkgs, ... }:

{
    fonts.packages = [
        (pkgs.iosevka.override {
         set = "Custom";
         privateBuildPlan = {
         family = "Iosevka Custom";
         spacing = "term";
         serifs = "sans";
         noCvSs = true;
         exportGlyphNames = false;

         variants = {
         inherits = "ss20";
         design = {
         seven = "curly-serifless-crossbar";
         capital-z = "curly-serifless-with-crossbar";
         z = "curly-serifless-with-crossbar";
         };
         };

         weights = {
         Regular = { shape = 400; menu = 400; css = 400; };
         Bold    = { shape = 700; menu = 700; css = 700; };
         };

         slopes = {
             Upright = { angle = 0;   shape = "upright"; menu = "upright"; css = "normal"; };
             Italic  = { angle = 9.4; shape = "italic";  menu = "italic";  css = "italic"; };
         };
         };
        })
    ];
}
