{ config, pkgs, ... }:

{
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
        extraConfig = {
            core.pager = "nvim +Man!";
        };
    };
}
