{ config, pkgs, pkgs-unstable, ... }:

{
    home.username = "mithe";
    home.homeDirectory = "/home/mithe";
    home.stateVersion = "25.11";
    programs.git = {
        enable = true;
        lfs.enable = true;
        settings.init.defaultBranch = "master";
        settings.user = {
            name = "Mikkel Thestrup";
            email = "mikkel@mithe.dk";
        };
        settings.alias = {
            c = "commit";
            s = "status --short";
            a = "add";
            p = "push";
            co = "checkout";
            cp = "cherry-pick";
            reb = "rebase";
        };
        signing = {
            key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCzc/Ki32+ssKF7puKrbZpW61mPhkXtsIDb4vs2CbGHBU7iw8Mag3TAIgz9ws801LxSZKkPZ4vDWJvNdTjv1Qm6NZ3mzEyGH4v9CA6cRXcO8zi1drKveGdjWCB271/j6cAI8ZjTyd+y/icmcx0AftaSxg3x6TRE18LQqb6W9RtZCnT9XiWWHfYXWc0jCprK30ejmXItuuhFi0WIr1fYVoWxs4bWVHGmx//VDgcxlrKd4E4k2DmzHtodpmtnXAsMEkQGNrFkQa7I18inKfeE4+qYWRVhMHFOgLSV9Dqjc+47gFuJa4IZARta09qLtfzrdpqGsZ2VI6lgfY3qTSzrTOys/TPG9qTu8oQD3jiALAwhP+N5KEaS0rMvk5ulCjK6u/+BtsbPQntZ1hXm9BUTLmwRLU+47HTuAJWN2Xdz8wHZa8bY+6kxZk8e2gQ4GEmfzTWnn/o1h9F944FEjchxjLsnUuzOWY7fi5Xw/T138CLWld+mq1TiCUYhc7sk0U7ZB7yFvcaFH4s3hjSw3aKwKpEpV8vDQ1cHyKl8zs9ycK/Lky62Y1hCZbwbIiwpIMXOdIapDECmBiS6o2S0RuWIo8rk6SluLUmEuJNgwckj2u53gX5f1vWKEOVQXwpNplp2MmPNNZ0Wb6rLbXamB/PtODqJUNZNk1YP22eI7X2kX+/zbw== mithe@desktop";
            signByDefault = true;
        };
        settings = {
            gpg = {
                format = "ssh";
            };
        };
    };

    programs.neovim = {
        enable = true;
        defaultEditor = true;
    };

    programs.zsh = {
        enable = true;
        syntaxHighlighting.enable = true;
        history.size = 10000;
        shellAliases = {
            g = "git";
            v = "nvim";
            ls = "eza --color --icons=always --long";
        };
    };

    services.picom.enable = true;

    imports = [
        ./modules/suckless.nix
    ];

    xsession = {
        enable = true;
        initExtra = ''
            ~/.fehbg &
            picom &
            setxkbmap us &
            xsetroot -cursor_name left_ptr &
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
            fzf
            nixd
            pavucontrol
            qutebrowser
            wallust
            killall
            xcursor-themes
            nerd-fonts.agave
            xclip
            ffmpeg
            gcc
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
