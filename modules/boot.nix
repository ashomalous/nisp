{
  flake.modules.nixos.bootloader =
    loader:
    {
      configurationLimit ? 5,
      cleanTmpOnBoot ? true,
    }:
    { lib, ... }:
    {
      boot = {
        loader = lib.mkMerge [
          {
            efi.canTouchEfiVariables = true;
            tmp.cleanOnBoot = cleanTmpOnBoot;
          }

          (lib.mkIf (loader == "systemd") {
            systemd-boot.enable = true;
            systemd-boot = { inherit configurationLimit; };
          })

          (lib.mkIf (loader == "grub") {
            grub = {
              enable = true;
              efiSupport = true;
              device = "nodev";
              inherit configurationLimit;
            };
          })
        ];
      };
    };
}
