{
  flake.nixosModules.filesystems = fileSystems: {
    inherit fileSystems;
  };

  flake.nixosModules.swapDevices = swapDevices: {
    inherit swapDevices;
  };
}
