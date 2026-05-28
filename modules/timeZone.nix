{
  flake.nixosModules.timeZone = timeZone: {
    time.timeZone = timeZone;
  };
}
