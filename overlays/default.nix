{
  inputs,
  self,
}: let
  inherit (inputs) zig-overlay blink-cmp zls;
in [
  zig-overlay.overlays.default
  (_: prev: {
    vimPlugins =
      prev.vimPlugins
      // self.vimPlugins.${prev.system}
      // {
        blink-cmp = blink-cmp.packages.${prev.system}.blink-cmp.overrideAttrs (_: prev: {version = "${prev.version}-${blink-cmp.rev}";});
        # inherit (blink-cmp.packages.${prev.system}) blink-cmp;
      };
    zls = zls.packages.${prev.system}.default;
    tree-sitter-grammars =
      prev.tree-sitter-grammars
      // {
        tree-sitter-zig_master = prev.tree-sitter.buildGrammar {
          version = inputs.treesitter-zig.shortRev;
          language = "zig";
          src = inputs.treesitter-zig;
        };
      };
  })
]
