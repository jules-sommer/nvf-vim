{lib}: {
  getModulesRecursive = {
    maxDepth ? 1,
    baseDir ? ./.,
    # This option toggles whether .nix files in a given directory
    # should be discovered in addition to that directories default.nix,
    # which is typically always imported when a directory is as per
    # the nix module system.
    includeNonDefaultNixFiles ? true,
    # This option allows you to exclude the top-level or depth=0 default.nix
    # file which is typically used when this function is called from that
    # default.nix file to recursively import nix files below it; in that case,
    # often you don't want to import the file which is calling this function.
    includeZeroDepthDefaultNix ? false,
    exclude ? null,
  }: let
    recurse = dir: depth: let
      # readDir happily accepts a path and returns an attrset
      entries = builtins.readDir dir;
      names = lib.attrNames entries;

      # decide which names to keep
      wantedName = name: let
        tp = entries.${name};
        isDefault = name == "default.nix";
      in
        if tp == "directory"
        then !lib.hasPrefix "." name
        else if tp == "regular" && lib.hasSuffix ".nix" name
        then
          if isDefault
          then depth > 0 || includeZeroDepthDefaultNix
          else includeNonDefaultNixFiles
        else false;

      filtered = lib.filter wantedName names;

      collect =
        lib.concatMap (
          name: let
            tp = entries.${name};
            pathValue = lib.path.append dir name;
          in
            if tp == "directory" && depth < maxDepth
            then recurse pathValue (depth + 1)
            else if tp == "regular"
            then [pathValue]
            else []
        )
        filtered;
    in
      collect;
  in
    # kick off with the path you passed in
    recurse baseDir 0;
}
