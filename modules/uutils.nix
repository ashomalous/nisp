{
  flake.nixosModules.uutils =
    prefixed:
    { pkgs, ... }:
    {
      environment.systemPackages =
        let
          pkg = if prefixed then pkgs.uutils-coreutils else pkgs.uutils-coreutils-noprefix;
        in
        [ pkg ];
    };
}
