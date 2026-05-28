{
  flake.nixosModules.fonts =
    {
      serif,
      sansSerif,
      monospace,
      emoji,
      extraFonts ? [ ],
    }:
    {
      fonts =
        let
          intoList = a: if builtins.isList then a else [ a ];
          serifList = intoList serif;
          sansSerifList = intoList sansSerif;
          monospaceList = intoList monospace;
          emojiList = intoList emoji;
        in
        {
          packages =
            let
              pkgsOf = map (font: font.package);
            in
            (pkgsOf serifList)
            ++ (pkgsOf sansSerifList)
            ++ (pkgsOf monospaceList)
            ++ (pkgsOf emojiList)
            ++ extraFonts;

          fontconfig =
            let
              familyOf = map (font: font.family);
            in
            {
              enable = true;
              defaultFonts = {
                serif = familyOf serifList;
                sansSerif = familyOf sansSerifList;
                monospace = familyOf monospaceList;
                emoji = familyOf emojiList;
              };
            };
        };
    };
}
