{ inputs, ... }:
{
  imports = [ inputs.devshell.flakeModule ];

  perSystem =
    {
      self',
      pkgs,
      lib,
      ...
    }:
    {
      devshells.default = {
        name = "ashix";

        packages = with pkgs; [
          just
          stow
          nh
        ];

        # make all flake apps available as commands. very useful in the context
        # of numtide/devshell because you get to see the description w/o doing
        # `nix flake show`
        commands = lib.mapAttrsToList (name: app: {
          inherit name;
          help = app.meta.description;
          command = ''
            pushd $(git rev-parse --show-toplevel)
            nix run .#${name}
            popd
          '';
        }) self'.apps;
      };
    };
}
