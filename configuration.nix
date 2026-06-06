{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hosts
    ./modules
    ./hjem.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_cachyos-lto-znver4;

  time.timeZone = "Europe/Warsaw";

  i18n.defaultLocale = "pl_PL.UTF-8";

  environment.systemPackages = with pkgs; [
    helix
    ghostty
    git
    firefox
    zed-editor
    kdePackages.dolphin
    sbctl
    btop
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.openssh.enable = true;

  services.xserver.videoDrivers = [ "amdgpu" ];

  zramSwap = {
    enable = true;
    priority = 100;
    memoryPercent = 100;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.11";
}
