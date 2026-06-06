{
  pkgs,
  ...
}:

{
  boot.loader = {
    efi.canTouchEfiVariables = true;
    limine = {
      enable = true;
      secureBoot = {
        enable = true;
        sbctl = pkgs.sbctl;
      };
      enableEditor = false;
      style = {
        wallpapers = [ ];
        interface = {
          resolution = "2880x1800";
          brandingColor = null;
        };
        graphicalTerminal = {
          palette = "060606;df6882;8cb66d;f3be7c;7e98e8;aeaed1;9bb4bc;cdcdcd";
          brightPalette = "060606;df6882;8cb66d;f3be7c;7e98e8;aeaed1;9bb4bc;cdcdcd";
          foreground = "cdcdcd";
          brightForeground = "cdcdcd";
          background = "060606";
          brightBackground = "060606";
        };
      };
      extraEntries = ''
        /Memtest86
          protocol: efi
          path: boot():/limine/efi/memtest86/BOOTX64.efi
          comment: Memtest86 ${pkgs.memtest86-efi.version}
      '';
      additionalFiles."efi/memtest86/BOOTX64.efi" = pkgs.memtest86-efi + /BOOTX64.efi;
     };
   timeout = 3;
  };
}
