{pkgs, ...}: let
  inherit (pkgs) vimUtils fetchFromGitHub;
  inherit (vimUtils) buildVimPlugin;
  inherit
    (builtins)
    readDir
    filter
    attrNames
    listToAttrs
    ;

  packagesDirContents = readDir ./.;
  packageNamesList = filter (name: packagesDirContents.${name} == "directory") (
    attrNames packagesDirContents
  );
in
  listToAttrs (
    map (name: {
      inherit name;
      value = import ./${name}/default.nix {
        inherit buildVimPlugin fetchFromGitHub pkgs;
      };
    })
    packageNamesList
  )
