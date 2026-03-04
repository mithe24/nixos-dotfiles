{ config, pkgs, ... }:

{
    programs.zsh = {
        enable = true;
        syntaxHighlighting.enable = true;
        history.size = 10000;
        initContent = ''
            PROMPT="%F{4}>>%f "

            autoload -Uz vcs_info
            precmd() {
                local cwd branch tag title
                cwd="''${PWD/#$HOME/~}"
                if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
                    branch=$(git symbolic-ref --short HEAD 2>/dev/null)
                    tag=$(git describe --tags --abbrev=0 2>/dev/null)
                    [[ -z "$branch" ]] && branch="DETACHED"
                    [[ -z "$tag" ]] && tag=""
                    title="''${cwd} | [''${branch}''${tag:+ ''${tag}}]"
                else
                    title="''${cwd}"
                fi
                    print -Pn "\e]0;''${title}\a"
            }

            # Shell options
            setopt append_history inc_append_history share_history
            setopt NO_BEEP
            setopt auto_menu menu_complete
            setopt autocd
            setopt auto_param_slash
            setopt no_case_glob no_case_match
            setopt globdots
            setopt extended_glob
            setopt interactive_comments
            setopt prompt_subst
            unsetopt prompt_sp
            setopt hist_ignore_dups
            setopt hist_ignore_space
            setopt hist_reduce_blanks

            # Disable Ctrl-S freeze
            stty stop undef

            # Trap Ctrl-C (show when terminal sends a interrup signal)
            TRAPINT() {
                print -Pn "%F{15}%K{9}^C%f%k"
                return 1
            }

            source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
        '';
        historySubstringSearch.enable = true; shellAliases = {
            g = "git";
            v = "nvim";
            ls = "eza --color --icons=always --long";
            rebuild = "sudo nixos-rebuild switch --flake ~/nixos'?submodules=1'";
        };
    };
}
