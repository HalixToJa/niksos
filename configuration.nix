{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./hjem.nix
  ];

  services.udisks2.enable = true;
  
  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;
      };
    };
  };

  xdg.portal = {
    enable = true;
    wlr = {
      enable = true;
    };
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.dbus.implementation = lib.mkForce "broker";

  security.polkit.enable = true;

  services.tuned.enable = true;

  services.upower.enable = true;

  boot.loader = {
    limine = {
      enable = true;
    };
    efi.canTouchEfiVariables = true;
  };
  networking = {
    hostName = "zenbook";
    networkmanager.enable = true;
  };
  time.timeZone = "Europe/Warsaw";

  i18n.defaultLocale = "pl_PL.UTF-8";

  users.users.halix = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  environment.systemPackages = with pkgs; [
    helix
    ghostty
    git
    firefox
    zed-editor
    kdePackages.dolphin
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  zramSwap = {
    enable = true;
    priority = 100;
    memoryPercent = 100;
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d --keep 3";
    flake = "/etc/nixos";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.11";
}
