{
  flake.nixosModules.filesystems =
    {
      root,
      boot,
      swapDevices ? [ ],
      extraFilesystems ? { },
    }:
    { lib, ... }:
    {
      fileSystems = lib.mkMerge [
        {
          "/" = {
            inherit (root) device fsType options;
          };
          "/boot" = {
            inherit (boot) device fsType options;
          };
        }
        extraFilesystems
      ];

      inherit swapDevices;
    };
}
