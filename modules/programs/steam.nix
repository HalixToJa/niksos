{
  pkgs,
  ...
}:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    gamescopeSession.enable = true;
    extraCompatPackages = with pkgs; [
      steamtinkerlaunch
      proton-cachyos_x86_64_v4
    ];
  };

  hardware.steam-hardware.enable = true;

  programs.gamemode.enable = true;
}
