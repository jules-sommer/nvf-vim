{lib, ...}: let
  inherit (lib) enabledLuaPlugin;
in {
  vim.formatter.conform-nvim = enabledLuaPlugin {
    formatters_by_ft = {
      lua = [
        "stylua"
      ];
      nix = [
        "alejandra"
      ];
    };
  };
}
