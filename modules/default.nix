{
  lib,
  pkgs,
  ...
}: let
  inherit
    (lib)
    enabled'
    enabled
    disabled
    disabled'
    ;
in {
  imports = lib.getModulesRecursive {
    baseDir = ./.;
    maxDepth = 2;
    includeNonDefaultNixFiles = true;
  };

  config = {
    _module.args = {
      inherit lib;
    };

    vim = {
      enableLuaLoader = true;
      additionalRuntimePaths = [];

      statusline.lualine = disabled' {
        theme = "tokyonight";
      };

      mini = {
        statusline = enabled;
      };

      theme = enabled' {
        name = "tokyonight";
        style = "storm";
        transparent = true;
      };

      autopairs.nvim-autopairs = enabled;

      debugger = {
        nvim-dap = enabled' {
          ui = enabled;
        };
      };

      comments = {
        comment-nvim = enabled;
      };

      binds = {
        whichKey =
          enabled'
          {
            setupOpts = {
              preset = "helix";
            };
          };
        cheatsheet = enabled;
      };

      telescope = disabled;

      git = enabled' {
        gitsigns = enabled' {
          codeActions = disabled;
        };
      };

      notify = {
        nvim-notify = disabled;
      };

      utility = {
        icon-picker = disabled;
        surround = enabled;
        diffview-nvim = enabled;

        motion = {
          hop = enabled;
          leap = enabled;
          precognition.enable = true;
        };

        images = {
          image-nvim = enabled' {
            setupOpts.backend = "kitty";
          };
        };
      };

      notes = {
        todo-comments = enabled;
      };

      ui = {
        breadcrumbs =
          enabled' {
          };
        borders = enabled;
        noice = enabled' {};
        colorizer = enabled;
        smartcolumn = disabled' {
          setupOpts.custom_colorcolumn = {
            nix = "110";
            ruby = "120";
            java = "130";
            go = [
              "90"
              "130"
            ];
          };
        };
      };
    };
  };
}
