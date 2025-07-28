({
  self,
  inputs,
  nvf,
  pkgs,
  system,
  lib,
  ...
}: let
  inherit (self) theme;
in {
  legacyPackages = pkgs;

  packages.${system}.default =
    (nvf.lib.neovimConfiguration {
      inherit pkgs;
      extraSpecialArgs = {inherit lib theme;};
      modules = [
        ./modules
        {vim.package = inputs.neovim-nightly.packages.${system}.default;}
      ];
    }).neovim;

  lib = import ./lib {
    inherit (pkgs) lib;
  };
  vimPlugins = import ./pkgs/default.nix {inherit pkgs;};
})
