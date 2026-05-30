{ pkgs, config, ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      wlroots_0_19 = prev.wlroots_0_19.overrideAttrs (oldAttrs: {
        patches = (oldAttrs.patcher or [ ]) ++ [
          ./patches/0001-Revert-compositor-send-WL_SURFACE_ERROR_INVALID_SIZE.patch
          ./patches/0001-xwayland-support-HiDPI-scale.patch
          ./patches/0002-Fix-configure_notify-event.patch
          ./patches/0003-Fix-size-hints-under-Xwayland-scaling.patch
        ];
      });
    })
  ];
}
