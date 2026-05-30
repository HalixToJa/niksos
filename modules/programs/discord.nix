{
  config,
  lib,
  pkgs,
  ...
}:

{
  hjem.users.halix = {
    packages = with pkgs; [
      (discord.override {
        withVencord = true;
      })
    ];
  };
}
