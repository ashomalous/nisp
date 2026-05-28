{
  flake.nixosModules.hardware = facterPath: {
    hardware.facter.reportPath = facterPath;
  };
}
