{lib, ...}: {
  # local open_command = 'xdg-open'
  # if vim.fn.has('mac') == 1 then
  #   open_command = 'open'
  # end
  #
  # local function url_repo()
  #   local cursorword = vim.fn.expand('<cfile>')
  #   if string.find(cursorword, '^[a-zA-Z0-9-_.]*/[a-zA-Z0-9-_.]*$') then
  #     cursorword = 'https://github.com/' .. cursorword
  #   end
  #   return cursorword or ''
  # end
  #
  # vim.keymap.set('n', 'gx', function()
  #   vim.fn.jobstart({ open_command, url_repo() }, { detach = true })
  # end, { silent = true })
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
