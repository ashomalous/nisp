{
  flake.nixosModules.nix-common =
    { inputs', lib, ... }:
    {
      nixpkgs.flake.setFlakeRegistry = true;
      nix.registry =
        inputs' |> lib.filterAttrs (_: lib.isType "flake") |> lib.mapAttrs (_: flake: { inherit flake; });
    };
}
