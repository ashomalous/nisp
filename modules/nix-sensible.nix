{
  flake.modules.nixos.nix-sensible = {
    nix.settings = {
      connect-timeout = 5;
      min-free = 128 * 1000 * 1000;
      max-free = 1 * 1000 * 1000 * 1000;
      fallback = true;
    };

    # nix.daemonCPUSchedPolicy = "batch";
    # nix.daemonIOSchedClass = "idle";
    # nix.daemonIOSchedPriority = 7;

    # systemd.services = {
    #   nix-gc.serviceConfig = {
    #     CPUSchedulingPolicy = "batch";
    #     IOSchedulingClass = "idle";
    #     IOSchedulingPriority = 7;
    #   };

    #   nix-daemon.serviceConfig.OOMScoreAdjust = 250;
    # };
  };
}
