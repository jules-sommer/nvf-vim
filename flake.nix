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
        ];

        pkgs = import nixpkgs {
          inherit system overlays;
        };

        lib = pkgs.lib.extend (
          _: prev:
            prev
            // nvf.lib
            // self.lib
        );
      in {
        packages.${system}.default =
          (nvf.lib.neovimConfiguration {
            inherit pkgs;
            extraSpecialArgs = {
              inherit lib;
            };
            modules = [
              ./modules
              {vim.package = inputs.neovim-nightly.packages.${system}.default;}
            ];
          }).neovim;

        lib = import ./lib {
          inherit (pkgs) lib;
        };
        vimPlugins = import ./pkgs {inherit pkgs;};
      }
    );

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
    nvf.url = "github:NotAShelf/nvf";

    julesdream.url = "/home/jules/000_dev/000_nix/julesdream";

    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
