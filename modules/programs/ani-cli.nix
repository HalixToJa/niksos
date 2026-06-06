{
  pkgs,
  ...
}:

{
  hjem.users.halix = {
    packages = [ pkgs.ani-cli ];
  };
}
