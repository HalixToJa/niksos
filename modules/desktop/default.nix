{
  config,
  ...
}:

{
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  imports = [
    ./mangowc.nix
    ./noctalia.nix
    ./scaling.nix
  ];
}
