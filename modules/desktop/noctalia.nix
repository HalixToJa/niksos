{
  pkgs,
  inputs,
  ...
}:

{
  hjem.users.halix = {
    packages = [ inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default ];
  };
}
