{ self, ... }:
{
  flake.nixosModules.displayManager =
    manager:
    {
      withWayland ? true,
      withX11 ? true,
    }:
    {
      imports =
        let
          displayManager =
            if manager == "ly" then
              self.nixosModules.ly { inherit withX11; }
            else if manager == "sddm" then
              self.nixosModules.sddm { inherit withWayland; }
            else if manager == "gdm" then
              self.nixosModules.gdm { inherit withWayland; }
            else
              throw "`${manager}` is not a supported display manager in nisp.";
        in
        [
          displayManager
        ];
    };
}
