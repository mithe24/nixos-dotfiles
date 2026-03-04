# My Nixos home manager config


> [!TIP]
> This repo uses the Git feature Submodules [[git-scm.com](https://git-scm.com/book/en/v2/Git-Tools-Submodules)],
> and this feature needs to be enabled when building with Nixos.
>
> This is done with the query parameter `.?submodules=1`.
> ```sh
> nixos-rebuild switch --flake ~/nixos-dotfiles'?submodules=1'
> ```
>
> Hopefully an option for `flake.nix` will be available at some point.
