{ self, ... }:
{
  flake.nixosModules.power-management = {
    imports = with self.nixosModules; [
      upower
      power-profiles
    ];
  };
}
