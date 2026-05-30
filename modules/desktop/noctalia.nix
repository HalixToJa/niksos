{
  pkgs,
  ...
}:

{
  hjem.users.halix = {
    packages = [ pkgs.noctalia-shell ];
  };
}
