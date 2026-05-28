{
  flake.nixosModules.gdm =
    {
      withWayland ? true,
    }:
    {
      services.displayManager.gdm.enable = true;
      services.displayManager.gdm.wayland = withWayland;
    };
}
