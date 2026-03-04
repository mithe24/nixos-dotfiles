{ config, pkgs, pkgs-unstable, ... }:

{
    home.username = "mithe";
    home.homeDirectory = "/home/mithe";
    home.stateVersion = "25.11";
    programs.neovim = {
        enable = true;
        defaultEditor = true;
    };

    services.picom.enable = true;

    imports = [
        ./modules/suckless.nix
        ./modules/zsh.nix
        ./modules/git.nix
        ./modules/fzf.nix
    ];

    xsession = {
        enable = true;
        initExtra = ''
            ~/.fehbg &
            picom &
            setxkbmap us &
            xsetroot -cursor_name left_ptr &
            unclutter -idle 1 &
            pulseaudio --start &
            xset s off
            xset -dpms
            xset s noblank
            xrandr --output DP-0 --mode 2560x1440 --rate 155 --primary &
            xrandr --output DP-3 --mode 1680x1050 --rate 60 &
        '';
    };

    home.packages = with pkgs; [
        neovim
        steam
        oversteer
        feh
        eza
        pavucontrol
        qutebrowser
        zathura
        wallust
        killall
        unclutter
        nerd-fonts.agave
        xclip
        ffmpeg
        git
    ];

    home.sessionVariables = {
        XDG_CONFIG_HOME = "$HOME/.config";
        XDG_DATA_HOME = "$HOME/.local/share";
        XDG_CACHE_HOME = "$HOME/.cache";
        XDG_RUNTIME_DIR = "$XDG_DATA_HOME/runtime";

        XDG_DOCUMENTS_DIR = "$HOME/documents";
        XDG_DOWNLOAD_DIR = "$HOME/downloads";
        XDG_MUSIC_DIR = "$HOME/music";
        XDG_PICTURES_DIR = "$HOME/pictures";
        XDG_VIDEOS_DIR = "$HOME/videos";
        XDG_WORK_DIR = "$HOME/work";
    };
}
