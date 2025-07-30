{lib, ...}: let
  inherit
    (lib)
    enabled
    disabled'
    ;
in {
  vim.visuals = {
    nvim-scrollbar = enabled;
    nvim-cursorline = disabled' {
      setupOpts = {
        cursorline = {
          enable = true;
          timeout = 50;
          number = false;
        };

        cursorword = {
          enable = true;
          min_length = 3;
          hl = {
            bold = true;
          };
        };
      };
    };

    highlight-undo = enabled;
    rainbow-delimiters = enabled;
  };
}
