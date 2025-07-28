{lib, ...}: {
  vim.keymaps = [
    {
      key = "<C-h>";
      mode = "n";
      silent = true;
      action = "<cmd>bprevious<CR>";
      desc = "previous [b]uffer";
    }
    {
      key = "<C-l>";
      mode = "n";
      silent = true;
      action = "<cmd>bnext<CR>";
      desc = "next [b]uffer";
    }
    {
      key = "<C-H>";
      mode = "n";
      silent = true;
      action = "<cmd>bfirst<CR>";
      desc = "first [B]uffer";
    }
    {
      key = "<C-L>";
      mode = "n";
      silent = true;
      action = "<cmd>blast<CR>";
      desc = "last [B]uffer";
    }
  ];
}
