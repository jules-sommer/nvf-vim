{lib, ...}: let
  inherit (lib) enabled';
in {
  vim = {
    keymaps = [
      {
        key = "<leader>o";
        desc = "Open [o]il-nvim interactive file explorer float.";
        mode = "n";
        lua = true;
        action = "require('oil').open_float";
      }
      {
        key = "<leader>ob";
        desc = "Open [o]il-nvim interactive file explorer [b]uffer.";
        mode = "n";
        lua = true;
        action = "require('oil').open";
      }
    ];

    utility.oil-nvim = enabled' {
      setupOpts = {
        default_file_explorer = true;
        constrain_cursor = "editable";
        skip_confirm_for_simple_edits = true;
        prompt_save_on_select_new_entry = true;
        delete_to_trash = true;
        watch_for_changes = false;
        columns = ["icon"];
        view_options = {
          show_hidden = false;
        };
        float = {
          padding = 3;
          border = "rounded";
        };
        keymaps = {
          "<C-c>" = "actions.close";
          "<C-.>" = "actions.toggle_hidden";
          "gd" = {
            desc = "Toggle file detail view";
            callback = lib.generators.mkLuaInline ''
              function()
                detail = not detail
                if detail then
                  require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
                else
                  require("oil").set_columns({ "icon" })
                end
              end
            '';
          };
        };
      };
    };
  };
}
