{
  flake.nixosModules.packages = packages: {
    environment.systemPackages = packages;
  };
}
