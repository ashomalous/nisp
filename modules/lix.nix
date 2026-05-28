{
  flake.nixosModules.nix-common =
    { pkgs, ... }:
    {
      nix.package = pkgs.lixPackageSets.stable.lix;
    };
}
