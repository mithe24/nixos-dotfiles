{
    description = "Nixos Configuration";
    inputs = {
        nixpkgs.url = "nixpkgs/nixos-25.11";
        nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager/release-25.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        neovim-nightly-overlay = {
            url = "github:nix-community/neovim-nightly-overlay";
        };
    };

    outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, neovim-nightly-overlay, ... }:
        let
            system = "x86_64-linux";
            pkgs = import nixpkgs {
                inherit system;
                config.allowUnfree = true;
                overlays = [ neovim-nightly-overlay.overlays.default ];
            };
        in {
            devShells.${system}.suckless = pkgs.mkShell {
                packages = with pkgs; [
                    pkg-config
                    xorg.libX11
                    xorg.libXft
                    xorg.libXinerama
                    fontconfig
                    freetype
                    harfbuzz
                    gcc
                    gnumake
                ];
            };

            nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./configuration.nix
                    home-manager.nixosModules.home-manager
                    { nixpkgs.pkgs = pkgs; }
                    {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            users.mithe = import ./home.nix;
                            backupFileExtension = "bak";
                        };
                    }
                ];
            };
        };
}
