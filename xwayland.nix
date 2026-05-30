{ pkgs, config, ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      xwayland = prev.xwayland.overrideAttrs (oldAttrs: {
        patches = (oldAttrs.patcher or [ ]) ++ [
          ./patches/hidpi.patch
        ];
      });
    })
  ];
}
