{
  outputs = inputs @ {
    self,
    utils,
    nixpkgs,
    neovim-nightly,
    nvf,
    ...
  }:
    utils.lib.eachDefaultSystemPassThrough (
      system: let
        overlays = import ./overlays {inherit self inputs;};
        pkgs = import nixpkgs {
          inherit system overlays;
        };
      in {
        legacyPackages = pkgs;
        packages.${system}.default =
          (nvf.lib.neovimConfiguration {
            inherit pkgs;
            extraSpecialArgs = {
              inherit inputs pkgs system;
              inherit (self) lib theme;
            };
            modules = [
              ./modules
              {vim.package = neovim-nightly.packages.${system}.default;}
            ];
          }).neovim;

        devShells.default = pkgs.mkShell {
          buildInputs =
            [
              self.packages.${system}.default
            ]
            ++ (with pkgs; [
              nodejs_24
              busybox
              ripgrep
              unzip
            ]);

          shellHook = ''
            ${nixpkgs.lib.getBin pkgs.fish}
          '';
        };

        vimPlugins.${system} = import ./pkgs {
          inherit pkgs utils;
          inherit (self) lib;
        };

        theme = import ./theme.nix;

        lib =
          import ./lib {lib = nixpkgs.lib.extend (_: prev: prev // nvf.lib // utils.lib);};
      }
    );

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
    nvf.url = "github:NotAShelf/nvf";

    blink-cmp.url = "github:Saghen/blink.cmp";

    zls = {
      url = "github:zigtools/zls";
      inputs.zig-overlay.follows = "zig-overlay";
    };

    zig-overlay.url = "github:mitchellh/zig-overlay";

    treesitter-zig = {
      url = "github:tree-sitter-grammars/tree-sitter-zig";
      flake = false;
    };

    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
