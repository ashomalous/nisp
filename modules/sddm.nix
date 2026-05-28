{
  flake.nixosModules.sddm =
    {
      withWayland ? false,
      compositor ? "weston",
    }:
    {
      services.displayManager.sddm = {
        enable = true;
        wayland.enable = withWayland;
        wayland.compositor = compositor;
      };
    };
}
