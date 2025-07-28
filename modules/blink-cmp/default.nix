{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) enabled' enabled;
in {
  vim.autocomplete.blink-cmp = enabled' {
    friendly-snippets = enabled;
    sourcePlugins = {
      emoji = enabled;
      ripgrep = enabled;
    };

    mappings = {
      close = "<C-c>";
    };

    setupOpts = {
      fuzzy = {
        implementation = "prefer_rust_with_warning";
        use_frecency = true;
        use_proximity = true;
      };

      signature = {enabled = true;};

      cmdline = {
        keymap = {preset = "default";};
        completion = {menu = {auto_show = true;};};
      };

      completion = {
        accept = {auto_brackets = {enabled = true;};};
        menu = {
          border = "rounded";
          winhighlight = "Normal:NormalFloat,CursorLine:BlinkCmpDocCursorLine,Search:None";
        };

        list = {
          selection = {
            preselect = true;
            auto_insert = false;
          };
        };

        documentation.window.border = "rounded";
      };
    };
  };
}
