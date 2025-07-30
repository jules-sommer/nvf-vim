{lib, ...}: let
  inherit (lib.generators) mkLuaInline;
in {
  vim = {
    augroups = let
      augroup = {
        enable ? true,
        clear ? true,
        name,
      }: {inherit enable clear name;};
    in [
      (augroup {name = "lazyvim_checktime";})
      (augroup {name = "lazyvim_highlight_yank";})
      (augroup {name = "lazyvim_resize_splits";})
      (augroup {name = "lazyvim_last_loc";})
      (augroup {name = "lazyvim_close_with_q";})
      (augroup {name = "lazyvim_man_unlisted";})
      (augroup {name = "lazyvim_wrap_spell";})
      (augroup {name = "lazyvim_json_conceal";})
      (augroup {name = "lazyvim_auto_create_dir";})
      (augroup {name = "blink-cmp-snacks-animate-toggle";})
    ];
    autocmds = [
      {
        enable = true;
        event = ["User"];
        pattern = ["BlinkCmpMenuOpen" "BlinkCmpMenuClose"];
        group = "blink-cmp-snacks-animate-toggle";
        callback = mkLuaInline ''
          function()
            local ok, scroll = pcall(require, "snacks.scroll")
            if not ok then
              vim.notify("Autocmd to toggle snacks.scroll animations couldn't find `snacks.scroll` module.", "error")
            else
              if scroll.enabled then
                scroll.disable()
              else
                scroll.enable()
              end
            end
          end
        '';
        desc = "Toggle snacks.scroll animations when blink-cmp menu is open to prevent visual bugs.";
      }
      {
        enable = true;
        event = ["FocusGained" "TermClose" "TermLeave"];
        group = "lazyvim_checktime";
        callback = mkLuaInline ''
          function()
            if vim.o.buftype ~= "nofile" then
              vim.cmd("checktime")
            end
          end
        '';
        desc = "Reload file when changed on focus or terminal close";
      }
      {
        enable = true;
        event = ["TextYankPost"];
        group = "lazyvim_highlight_yank";
        callback = mkLuaInline ''
          function()
            (vim.hl or vim.highlight).on_yank()
          end
        '';
        desc = "Highlight on yank";
      }
      {
        enable = true;
        event = ["VimResized"];
        group = "lazyvim_resize_splits";
        callback = mkLuaInline ''
          function()
            local current_tab = vim.fn.tabpagenr()
            vim.cmd("tabdo wincmd =")
            vim.cmd("tabnext " .. current_tab)
          end
        '';
        desc = "Resize splits on window resize";
      }
      {
        enable = true;
        event = ["BufReadPost"];
        group = "lazyvim_last_loc";
        callback = mkLuaInline ''
          function(event)
            local exclude = { "gitcommit" }
            local buf     = event.buf
            if vim.tbl_contains(exclude, vim.bo[buf].filetype)
               or vim.b[buf].lazyvim_last_loc then
              return
            end
            vim.b[buf].lazyvim_last_loc = true
            local mark   = vim.api.nvim_buf_get_mark(buf, '"')
            local lcount = vim.api.nvim_buf_line_count(buf)
            if mark[1] > 0 and mark[1] <= lcount then
              pcall(vim.api.nvim_win_set_cursor, 0, mark)
            end
          end
        '';
        desc = "Jump to last edit location on buffer open";
      }
      {
        enable = true;
        event = ["FileType"];
        pattern = [
          "PlenaryTestPopup"
          "checkhealth"
          "dbout"
          "gitsigns-blame"
          "grug-far"
          "help"
          "lspinfo"
          "neotest-output"
          "neotest-output-panel"
          "neotest-summary"
          "notify"
          "qf"
          "spectre_panel"
          "startuptime"
          "tsplayground"
        ];
        group = "lazyvim_close_with_q";
        callback = mkLuaInline ''
          function(event)
            vim.bo[event.buf].buflisted = false
            vim.schedule(function()
              vim.keymap.set("n", "q", function()
                vim.cmd("close")
                pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
              end, {
                buffer = event.buf,
                silent = true,
                desc   = "Quit buffer",
              })
            end)
          end
        '';
        desc = "Close various popups and help with <q>";
      }
      {
        enable = true;
        event = ["FileType"];
        pattern = ["man"];
        group = "lazyvim_man_unlisted";
        callback = mkLuaInline ''
          function(event)
            vim.bo[event.buf].buflisted = false
          end
        '';
        desc = "Unlist inline man pages";
      }
      {
        enable = true;
        event = ["FileType"];
        pattern = ["text" "plaintex" "typst" "gitcommit" "markdown"];
        group = "lazyvim_wrap_spell";
        callback = mkLuaInline ''
          function()
            vim.opt_local.wrap  = true
            vim.opt_local.spell = true
          end
        '';
        desc = "Enable wrap and spell in text files";
      }
      {
        enable = true;
        event = ["FileType"];
        pattern = ["json" "jsonc" "json5"];
        group = "lazyvim_json_conceal";
        callback = mkLuaInline ''
          function()
            vim.opt_local.conceallevel = 0
          end
        '';
        desc = "Disable conceal for JSON files";
      }
      {
        enable = true;
        event = ["BufWritePre"];
        group = "lazyvim_auto_create_dir";
        callback = mkLuaInline ''
          function(event)
            if event.match:match("^%w%w+:[\\/][\\/]") then
              return
            end
            local file = vim.uv.fs_realpath(event.match) or event.match
            vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
          end
        '';
        desc = "Auto-create parent directories before saving";
      }
    ];
  };
}
