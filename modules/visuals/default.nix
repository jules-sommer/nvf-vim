{ lib, ... }:
let
  inherit (lib)
    enabled
    enabled'
    disabled
    disabled'
    ;
in
{
  vim.visuals = {
    nvim-scrollbar = enabled;
    nvim-web-devicons = enabled;
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
            underline = true;
          };
        };
      };
    };

    highlight-undo = enabled;
    indent-blankline = enabled' {
      setupOpts = {
        scope = {
          show_start = false;
        };
      };
    };
    rainbow-delimiters = enabled;
  };
}
