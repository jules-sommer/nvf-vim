{lib, ...}: let
  inherit (lib) enabled';
in {
  vim = {
    keymaps = [
      {
        key = "<leader>o";
        mode = "n";
        silent = true;
        lua = true;
        noremap = true;
        action = "require('oil').open_float";
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
        };
      };
    };
  };
}
