{
  flake.nixosModules.audio =
    usePipewire:
    { lib, ... }:
    {
      # Enable sound with pipewire.
      services.pulseaudio.enable = !usePipewire;
      security.rtkit.enable = true;
      services.pipewire = lib.mkIf usePipewire {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        # If you want to use JACK applications, uncomment this
        #jack.enable = true;

        # use the example session manager (no others are packaged yet so this is enabled by default,
        # no need to redefine it in your config for now)
        #media-session.enable = true;
      };
    };
}
