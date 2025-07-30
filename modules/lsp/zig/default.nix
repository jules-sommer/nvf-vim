{
  pkgs,
  lib,
  ...
}: let
  inherit (lib) enabled enabled';
in {
  vim.languages.zig = enabled' {
    treesitter = enabled' {
      package = pkgs.tree-sitter-grammars.tree-sitter-zig_master;
    };
    dap = enabled;
    lsp = enabled' {
      package = pkgs.zls;
      server = "zls";
    };
  };
}
