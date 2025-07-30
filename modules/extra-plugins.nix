{
  lib,
  pkgs,
  config,
  ...
}: {
  options.vim = {
    deferred-clipboard = let
      inherit (config.vim.clipboard) registers;
      inherit (lib) types mkEnableOption;
    in {
      enable = mkEnableOption "Enable `deferred-clipboard.nvim` plugin.";
      setupOpts = lib.nvim.types.mkPluginSetupOption "deferred-clipboard" {
        fallback = lib.mkOption {
          type = lib.types.string;
          desc = "Defines the clipboard behaviour to fallback to before the deferred-clipboard is setup, i.e before support for focus-change events is detected in your terminal. By default, set to *either* the value of `config.vim.clipboard.registers` OR if that option is unset, defaults to `unnamedplus`.";
          default =
            if registers != ""
            then registers
            else "unnamedplus";
        };

        lazy = lib.mkOption {
          type = types.bool;
          default = false;
          desc = "Whether to improve startup time by lazily deferring Neovim's access to the system clipboard. This can cause issues if your config relies on this behaviour so enable with caution. By default, set to `false`.";
        };

        force_init_unnamed = lib.mkOption {
          type = types.bool;
          default = false;
          desc = "Whether to overwrite the `\"` register on setup if it is *not empty*. By default, set to `false`.";
        };
      };
    };
  };

  config.vim.extraPlugins = let
    inherit (pkgs) vimPlugins;
  in {
    blink-cmp.package = vimPlugins.blink-cmp;
    qbessa.package = vimPlugins.qbessa;
    vim-wordmotion.package = vimPlugins.vim-wordmotion;
    vim-smartword.package = vimPlugins.vim-smartword;
    inc-rename = {
      package = vimPlugins.inc-rename-nvim;
      setup = ''
        require("inc_rename").setup {
          input_buffer_type = "snacks",
        }
      '';
    };

    oil-git = {
      package = vimPlugins.oil-git;
    };

    oil-lsp-diagnostics = {
      package = vimPlugins.oil-lsp-diagnostics;
    };

    deferred-clipboard = {
      package = vimPlugins.deferred-clipboard;
      setup = ''
        require('deferred-clipboard').setup {
          fallback = '${
          if config.vim.clipboard.registers != ""
          then config.vim.clipboard.registers
          else "unnamedplus"
        }',
        }
      '';
    };

    nvim-highlight-colors = {
      package = vimPlugins.nvim-highlight-colors;
      setup = ''
        require('${vimPlugins.nvim-highlight-colors.pname}').setup {
        	render = 'virtual',
        	virtual_symbol = '⬤',
        	virtual_symbol_position = 'inline',
          virtual_symbol_prefix = ' ',
        	enable_named_colors = false,
        	enable_tailwind = true,
        }
      '';
    };
    "mini.tabline" = {
      package = "mini-tabline";
      setup = "require('mini.tabline').setup()";
    };
  };
}
