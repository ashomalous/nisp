{
  flake.nixosModules.locale =
    defaultLocale:
    {
      LC_ADDRESS ? defaultLocale,
      LC_IDENTIFICATION ? defaultLocale,
      LC_MEASUREMENT ? defaultLocale,
      LC_MONETARY ? defaultLocale,
      LC_NAME ? defaultLocale,
      LC_NUMERIC ? defaultLocale,
      LC_PAPER ? defaultLocale,
      LC_TELEPHONE ? defaultLocale,
      LC_TIME ? defaultLocale,
    }:
    {
      i18n = {
        inherit defaultLocale;
        extraLocaleSettings = {
          inherit
            LC_ADDRESS
            LC_IDENTIFICATION
            LC_MEASUREMENT
            LC_MONETARY
            LC_NAME
            LC_NUMERIC
            LC_PAPER
            LC_TELEPHONE
            LC_TIME
            ;
        };
      };
    };
}
