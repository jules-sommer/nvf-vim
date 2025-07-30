{
  lib,
  pkgs,
  ...
}:
lib.mapAttrs (
  path: _:
    import ./${path}/package.nix {
      inherit pkgs;
    }
)
(lib.filterAttrs (_: kind: kind == "directory") (builtins.readDir ./.))
