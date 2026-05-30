{
  inputs,
  lib,
  config,
  ...
}: let
  inherit (inputs.hjem) packages;
  inherit (config.nixpkgs.hostPlatform) system;
in {
  imports = [
    ./modules
  ];
  hjem = {
    users.halix = {
      user = "halix";
      directory = "/home/halix";
    };
    clobberByDefault = true;
    linker = packages.${system}.smfh;
  };
}
