{lib, ...}: let
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

          draw = {
            components = {
              kind_icon = {
                text = lib.generators.mkLuaInline ''
                  function(ctx)
                    local icon = ctx.kind_icon
                  	if ctx.item.source_name == "LSP" then
                  		local color_item = require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
                  		if color_item and color_item.abbr ~= "" then
                  		  icon = color_item.abbr
                  		end
                  	end
                  	return icon .. ctx.icon_gap
                  end
                '';
                highlight = lib.generators.mkLuaInline ''
                  function(ctx)
                    local highlight = "BlinkCmpKind" .. ctx.kind
                    if ctx.item.source_name == "LSP" then
                      local color_item = require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
                      if color_item and color_item.abbr_hl_group then
                        highlight = color_item.abbr_hl_group
                      end
                    end
                    return highlight
                  end
                '';
              };
            };
          };
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
