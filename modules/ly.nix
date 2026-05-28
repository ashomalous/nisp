{
  flake.nixosModules.ly =
    {
      withX11 ? true,
    }:
    {
      services.displayManager.ly = {
        enable = true;
        x11Support = withX11;
      };
    };
}
