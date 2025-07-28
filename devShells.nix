{
  self,
  pkgs,
  lib,
  system,
  ...
}: {
  devShells.${system}.default = pkgs.mkShell {
    buildInputs =
      [
        self.packages.${system}.default
      ]
      ++ (with pkgs; [
        nodejs_24
        busybox
        unzip
      ]);

    shellHook = ''
      ${lib.getBin pkgs.fish}
    '';
  };
}
