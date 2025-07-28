{
  vim.keymaps = [
    {
      key = "<leader><space>";
      lua = true;
      mode = ["n"];
      action = ''
        function() Snacks.picker.smart() end
      '';
      desc = "Smart Find Files";
    }
    {
      key = "<leader>,";
      lua = true;

      mode = ["n"];
      action = ''
        function() Snacks.picker.buffers() end
      '';
      desc = "Buffers";
    }
    {
      key = "<leader>/";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.grep()
        end
      '';
      desc = "Grep";
    }
    {
      key = "<leader>:";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.command_history()
        end
      '';
      desc = "Command History";
    }
    {
      key = "<leader>n";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.notifications()
        end
      '';
      desc = "Notification History";
    }
    {
      key = "<leader>e";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.explorer()
        end
      '';
      desc = "File Explorer";
    }
    {
      key = "<leader>fb";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.buffers()
        end
      '';
      desc = "Buffers";
    }
    {
      key = "<leader>fc";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
        end
      '';
      desc = "Find Config File";
    }
    {
      key = "<leader>ff";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.files()
        end
      '';
      desc = "Find Files";
    }
    {
      key = "<leader>fg";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.git_files()
        end
      '';
      desc = "Find Git Files";
    }
    {
      key = "<leader>fp";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.projects()
        end
      '';
      desc = "Projects";
    }
    {
      key = "<leader>fr";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.recent()
        end
      '';
      desc = "Recent";
    }
    {
      key = "<leader>gb";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.git_branches()
        end
      '';
      desc = "Git Branches";
    }
    {
      key = "<leader>gl";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.git_log()
        end
      '';
      desc = "Git Log";
    }
    {
      key = "<leader>gL";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.git_log_line()
        end
      '';
      desc = "Git Log Line";
    }
    {
      key = "<leader>gs";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.git_status()
        end
      '';
      desc = "Git Status";
    }
    {
      key = "<leader>gS";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.git_stash()
        end
      '';
      desc = "Git Stash";
    }
    {
      key = "<leader>gd";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.git_diff()
        end
      '';
      desc = "Git Diff (Hunks)";
    }
    {
      key = "<leader>gf";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.git_log_file()
        end
      '';
      desc = "Git Log File";
    }
    {
      key = "<leader>sb";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.lines()
        end
      '';
      desc = "Buffer Lines";
    }
    {
      key = "<leader>sB";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.grep_buffers()
        end
      '';
      desc = "Grep Open Buffers";
    }
    {
      key = "<leader>sg";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.grep()
        end
      '';
      desc = "Grep";
    }
    {
      key = "<leader>sw";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.grep_word()
        end
      '';
      desc = "Visual selection or word";
    }
    {
      key = "<leader>s\"";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.registers()
        end
      '';
      desc = "Registers";
    }
    {
      key = "<leader>s/";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.search_history()
        end
      '';
      desc = "Search History";
    }
    {
      key = "<leader>sa";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.autocmds()
        end
      '';
      desc = "Autocmds";
    }
    {
      key = "<leader>sb";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.lines()
        end
      '';
      desc = "Buffer Lines";
    }
    {
      key = "<leader>sc";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.command_history()
        end
      '';
      desc = "Command History";
    }
    {
      key = "<leader>sC";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.commands()
        end
      '';
      desc = "Commands";
    }
    {
      key = "<leader>sd";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.diagnostics()
        end
      '';
      desc = "Diagnostics";
    }
    {
      key = "<leader>sD";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.diagnostics_buffer()
        end
      '';
      desc = "Buffer Diagnostics";
    }
    {
      key = "<leader>sh";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.help()
        end
      '';
      desc = "Help Pages";
    }
    {
      key = "<leader>sH";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.highlights()
        end
      '';
      desc = "Highlights";
    }
    {
      key = "<leader>si";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.icons()
        end
      '';
      desc = "Icons";
    }
    {
      key = "<leader>sj";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.jumps()
        end
      '';
      desc = "Jumps";
    }
    {
      key = "<leader>sk";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.keymaps()
        end
      '';
      desc = "Keymaps";
    }
    {
      key = "<leader>sl";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.loclist()
        end
      '';
      desc = "Location List";
    }
    {
      key = "<leader>sm";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.marks()
        end
      '';
      desc = "Marks";
    }
    {
      key = "<leader>sM";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.man()
        end
      '';
      desc = "Man Pages";
    }
    {
      key = "<leader>sp";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.lazy()
        end
      '';
      desc = "Search for Plugin Spec";
    }
    {
      key = "<leader>sq";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.qflist()
        end
      '';
      desc = "Quickfix List";
    }
    {
      key = "<leader>sR";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.resume()
        end
      '';
      desc = "Resume";
    }
    {
      key = "<leader>su";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.undo()
        end
      '';
      desc = "Undo History";
    }
    {
      key = "<leader>uC";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.colorschemes()
        end
      '';
      desc = "Colorschemes";
    }
    {
      key = "gd";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.lsp_definitions()
        end
      '';
      desc = "Goto Definition";
    }
    {
      key = "gD";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.lsp_declarations()
        end
      '';
      desc = "Goto Declaration";
    }
    {
      key = "gr";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.lsp_references()
        end
      '';
      nowait = true;
      desc = "References";
    }
    {
      key = "gI";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.lsp_implementations()
        end
      '';
      desc = "Goto Implementation";
    }
    {
      key = "gy";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.lsp_type_definitions()
        end
      '';
      desc = "Goto T[y]pe Definition";
    }
    {
      key = "<leader>ss";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.lsp_symbols()
        end
      '';
      desc = "LSP Symbols";
    }
    {
      key = "<leader>sS";
      mode = ["n"];
      lua = true;
      action = ''
        function()
          Snacks.picker.lsp_workspace_symbols()
        end
      '';
      desc = "LSP Workspace Symbols";
    }
  ];
}
