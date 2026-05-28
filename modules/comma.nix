{
  flake.nixosModules.comma =
    {
      inputs',
      pkgs,
      lib,
      ...
    }:
    {
      imports = [ inputs'.nix-index-database.nixosModules.nix-index ];

      programs.command-not-found.enable = false;
      programs.nix-index-database.comma.enable = true;

      environment.variables.COMMA_PICKER = lib.getExe pkgs.skim;
    };
}
