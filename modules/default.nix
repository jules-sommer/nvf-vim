{
  lib,
  pkgs,
  ...
}: let
  inherit
    (lib)
    filterAttrs
    path
    concatMap
    map
    hasSuffix
    enabled'
    enabled
    disabled
    disabled'
    ;

  inherit (builtins) attrNames readDir pathExists;
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
      additionalRuntimePaths = [
      ];

      diagnostics = {
      };

      statusline = {
        lualine = enabled' {
          theme = "tokyonight";
        };
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
        whichKey = enabled;
        cheatsheet = enabled;
      };

      telescope = enabled;

      git = enabled' {
        gitsigns = enabled' {
          codeActions = disabled;
        };
      };

      notify = {
        nvim-notify = enabled;
      };

      dashboard = {
        dashboard-nvim = disabled;
      };

      autocomplete.blink-cmp = enabled' {
        friendly-snippets = enabled;
        mappings = {
          close = "<C-c>";
        };
        setupOpts = {
          fuzzy.implementation = "prefer_rust_with_warning";
          signature = {enabled = true;};
        };
      };
      utility = {
        icon-picker = enabled;
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
        borders = enabled;
        noice = enabled;
        colorizer = enabled;
        smartcolumn = disabled' {
          setupOpts.custom_colorcolumn = {
            # this is a freeform module, it's `buftype = int;` for configuring column position
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
