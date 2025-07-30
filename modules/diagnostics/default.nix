{lib, ...}: let
  inherit (lib) disabled enabled';
in {
  vim.keymaps = [
    {
      key = "<leader>ll";
      mode = "n";
      silent = true;
      lua = true;
      action = ''
        function()
          vim.diagnostic.config({ virtual_lines = not vim.diagnostic.config().virtual_lines, })
        end
      '';
      desc = "Toggle diagnostic virtual_[l]ines.";
    }
  ];
  vim.diagnostics = enabled' {
    config = {
      virtual_lines = true;
      virtual_text = false;
    };
  };
}
