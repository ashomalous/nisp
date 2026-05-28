{
  flake.modules.nixos.hardware = facterPath: {
    hardware.facter.reportPath = facterPath;
  };
}
