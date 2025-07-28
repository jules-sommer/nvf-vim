{
  outputs = {
    self,
    utils,
    nixpkgs,
    nvf,
    ...
  } @ inputs:
    utils.lib.eachDefaultSystemPassThrough (
      system: let
        overlays = [
          (_: prev: {
            extraVimPlugins = self.vimPlugins;
            vimPlugins = prev.vimPlugins // self.vimPlugins;
          })
          (_: prev: {
            vimPlugins =
              prev.vimPlugins
              // {
                inherit (inputs.blink-cmp.packages.${prev.system}) blink-cmp;
              };
          })
        ];

        pkgs = import nixpkgs {
          inherit system overlays;
        };

        lib = pkgs.lib.extend (_: prev: prev // nvf.lib // self.lib);
      in
        utils.lib.meld (inputs
          // {inherit system pkgs lib self inputs;}) [
          ./devShells.nix
          ./packages.nix
          ./theme.nix
        ]
    );

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
    nvf.url = "github:NotAShelf/nvf";

    blink-cmp.url = "github:Saghen/blink.cmp";

    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
