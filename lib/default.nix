{lib, ...}: let
  inherit (builtins) attrNames readDir pathExists;
  inherit
    (lib)
    filterAttrs
    hasSuffix
    path
    concatMap
    map
    mapAttrs
    ;
in rec {
  enabled = enabled' {};
  enabled' = extra:
    {
      enable = true;
    }
    // extra;

  disabled = disabled' {};
  disabled' = extra:
    {
      enable = false;
    }
    // extra;

  getFilteredModuleNames = {
    base-dir,
    includeNixFiles ? true,
  }:
    map (name: path.append base-dir name) (
      attrNames (filterAttrs (
        name: type:
          (type == "directory")
          || (includeNixFiles && type == "regular" && isNixFile {inherit name;})
      ) (readDir base-dir))
    );

  isWanted = includeDefaultNix: name: type: (type == "directory" && !(lib.hasPrefix "." name)) || (type == "regular" && lib.isNixFile {inherit name includeDefaultNix;});

  getModulesRecursive = {
    maxDepth ? 1,
    baseDir ? ./.,
    includeNonDefaultNixFiles ? true,
    includeZeroDepthDefaultNix ? false,
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

  getFilteredModulePathsRecursive = {
    base-dir ? ./.,
    includeNixFiles ? true,
    max-depth ? 1,
  }: let
    inner = currentDir: depth: let
      entries = builtins.readDir currentDir;

      filtered =
        lib.filterAttrs (
          name: type:
          # Include non-hidden directories for recursion
            (type == "directory" && !(lib.hasPrefix "." name))
            ||
            # Include valid Nix files
            (type
              == "regular"
              && isNixFile {
                inherit name;
                includeDefaultNix = includeNixFiles;
              })
        )
        entries;

      # Process current directory entries
      process = name: type:
        if type == "directory" && depth < max-depth
        then
          # Recurse into subdirectory
          inner (lib.path.append currentDir name) (depth + 1)
        else if type == "regular"
        then
          # Return file path
          [(lib.path.append currentDir name)]
        else
          # Skip other entries
          [];

      # Collect all paths
      paths = lib.flatten (lib.mapAttrsToList process filtered);
    in
      paths;
  in
    inner base-dir 0;

  isNixFile = {
    name,
    includeDefaultNix ? false,
  }:
    hasSuffix ".nix" name && (includeDefaultNix || name != "default.nix");

  hasDefaultNix = dir: pathExists (path.append dir "default.nix");
}
