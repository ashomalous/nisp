{
  flake.nixosModules.bluetooth = powerOnBoot: {
    hardware.bluetooth = {
      enable = true;
      inherit powerOnBoot;
    };
  };
}
