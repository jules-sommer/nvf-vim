{lib, ...}: {
  meld' = inputs:
    builtins.foldl' (output: subflake:
      lib.recursiveUpdate output (import subflake inputs));

  meld = inputs: mergedOutputs:
    builtins.foldl' (
      acc: subflake: let
        imported = import subflake {
          inherit inputs;
          self = mergedOutputs;
        };
      in
        lib.recursiveUpdate acc imported
    ) {};
}
