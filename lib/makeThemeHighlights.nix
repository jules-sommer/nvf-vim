{lib, ...}: let
  inherit (lib) flattenTree;
in {
  # Import your theme attrset
  # mkThemeHighlights: generates highlight groups from a theme
  # Params:
  #   themeAttrset     - the attrset of colors (e.g. theme)
  #   field            - either "fg" or "bg" (defaults to "fg")
  #   nameTransform    - function to transform each TitleCase name (defaults to prefixing "Theme")
  #   extras           - optional attrset mapping group names to extra options
  mkThemeHighlights = {
    theme,
    field ? "fg",
    nameTransform ? (name: "Theme" + name),
    extras ? {},
  }: let
    # Recursively flatten nested attrsets into a list of { name, color } records
    flatten = attr: prefix:
      builtins.concatLists (
        map (
          key: let
            val = attr.${key};
            cap = lib.strings.capitalize key;
            newPre =
              if prefix == ""
              then cap
              else prefix + cap;
          in
            if lib.isAttrs val
            then flatten val newPre
            else [
              {
                rawName = newPre;
                color = val;
              }
            ]
        )
        (lib.attrNames attr)
      );
  in
    lib.listToAttrs (
      map (
        g: let
          groupName = nameTransform g.rawName;
          extra = lib.getAttr groupName extras {};
        in {
          name = groupName;
          value = {"${field}" = g.color;} // extra;
        }
      )
      (flattenTree theme)
    );
}
