{lib, ...}:
lib.extend (_: prev:
    prev
    // lib.foldl' (a: b: a // b) {} (lib.attrValues (
      lib.mapAttrs (filename: _: import ./${filename} {inherit lib;})
      (lib.filterAttrs (filename: kind:
        kind
        == "regular"
        && lib.hasSuffix "nix" filename
        && filename != "default.nix")
      (builtins.readDir ./.))
    )))
