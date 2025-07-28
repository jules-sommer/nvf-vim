_: {
  vim.keymaps = [
    {
      key = "<leader>bd";
      lua = true;
      mode = ["n"];
      action = ''
        function()
          Snacks.bufdelete.delete()
        end
      '';
      desc = "[b]uffer [d]elete";
    }
    {
      key = "<leader>bda";
      lua = true;
      mode = ["n"];
      action = ''
        function()
          Snacks.bufdelete.all()
        end
      '';
      desc = "[b]uffers [d]elete [a]ll";
    }
    {
      key = "<leader>bdo";
      lua = true;
      mode = ["n"];
      action = ''
        function()
          Snacks.bufdelete.other()
        end
      '';
      desc = "[b]uffers [d]elete [o]thers";
    }
  ];
}
