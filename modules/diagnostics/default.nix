{lib, ...}: let
  inherit (lib) disabled enabled';
in {
  vim.diagnostics = enabled' {
    config = {
      virtual_lines = true;
      virtual_text = false;
    };
  };
}
