{ config, lib, pkgs, ... }:

{
    imports =
        [
        ./hardware-configuration.nix
        ./modules/fonts.nix
        ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "desktop";
    networking.networkmanager.enable = true;
    services.avahi = {
        enable = true;
        nssmdns4 = true;
        publish = {
            enable = true;
            addresses = true;
            workstation = true;
        };
    };

    time.timeZone = "Europe/Copenhagen";

    services.dbus.enable = true;
    services.pipewire.enable = false;
    services.pulseaudio.enable = true;

    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
    };

    hardware.cpu.amd.updateMicrocode = true;
    services.fwupd.enable = true;

    # OpenGL
    hardware.graphics = {
        enable = true;
    };

    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = false;
        powerManagement.finegrained = false;
        open = false;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    hardware.nvidia.prime.offload.enable = false;

    services.udev.packages = with pkgs; [ oversteer ];
    services.udev.extraRules = ''
        ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c261", RUN+="${pkgs.usb-modeswitch}/bin/usb_modeswitch -v 046d -p c261 -m 01 -r 01 -C 03 -M '0f00010142'"
    '';
    hardware.new-lg4ff.enable = true;

    services.displayManager.ly.enable = true;
    services.xserver = {
        enable = true;
        displayManager.startx.enable = true;
        autoRepeatDelay =200;
        autoRepeatInterval = 35;
    };

    services.xserver.windowManager.dwm = {
        enable = true;
        package = pkgs.dwm.overrideAttrs {
            src = ./config/dwm;
        };
    };

    programs.zsh.enable = true;
    users.users.mithe = {
        isNormalUser = true;
        extraGroups = [ "wheel" "input" ];
        shell = pkgs.zsh;
        packages = with pkgs; [
            tree
        ];
    };

    services.fail2ban.enable = true;
    services.openssh = {
        enable = true;
        settings = {
            PasswordAuthentication = false;
            KbdInteractiveAuthentication = false;
            PermitRootLogin = "no";
            AllowUsers = [ "mithe" ];
        };
    };

    environment.systemPackages = with pkgs; [
        vim
        git
        killall
        oversteer
    ];

    security.sudo.wheelNeedsPassword = false;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    system.stateVersion = "25.11";
}
