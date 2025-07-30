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
      globals = {
        maplocalleader = " ";
        P = lib.generators.mkLuaInline ''
          function (v)
            print(vim.inspect(v))
            return v
          end
        '';
      };
      enableLuaLoader = true;
      additionalRuntimePaths = [];

      # statusline.lualine = disabled' {
      #   theme = "tokyonight";
      # };

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
        cheatsheet = disabled;
      };

      telescope = disabled;

      git = disabled' {
        gitsigns = enabled' {
          codeActions = disabled;
        };
      };

      notify = {
        nvim-notify = disabled;
      };

      utility = {
        undotree = enabled;
        icon-picker = disabled;
        surround = disabled;
        diffview-nvim = disabled;

        motion = {
          hop = disabled;
          leap = disabled;
          flash-nvim = lib.enabledLuaPlugin {
            modes = {
              char = {
                enabled = true;
                autohide = false;
                jump_labels = true;
                multi_line = false;
              };
            };
          };

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
        breadcrumbs = enabled' {
          source = "nvim-navic";
          navbuddy = enabled;
        };
        borders = enabled' {
          globalStyle = "rounded";
        };
        noice = enabled;
      };
    };
  };
}
