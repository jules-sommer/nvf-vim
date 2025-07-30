{lib, ...}: let
  inherit (lib) enabled enabled';
in {
  vim = {
    clipboard = enabled' {
      providers.wl-copy = enabled;
      registers = "unnamedplus";
    };
    options = {
      cmdheight = 1; # more space in the neovim command line for displaying messages
      showmode = false; # we don't need to see things like -- INSERT -- anymore
      smartcase = true; # smart case
      splitbelow = true; # force all horizontal splits to go below current window
      splitright = true; # force all vertical splits to go to the right of current window
      swapfile = false; # creates a swapfile
      termguicolors = true; # set term gui colors (most terminals support this)
      timeoutlen = 350; # time to wait for a mapped sequence to complete (in milliseconds)
      title = true; # set the title of window to the value of the titlestring
      titlestring = "%<%F%=%l/%L - gurlvim"; # what the title of the window will be set to
      undofile = true; # enable persistent undo
      updatetime = 50; # faster completion
      expandtab = true; # convert tabs to spaces
      autoindent = true;
      smartindent = true;
      shiftwidth = 2; # the number of spaces inserted for each indentation
      softtabstop = 2;
      tabstop = 2; # insert 2 spaces for a tab
      cursorline = true; # highlight the current line
      relativenumber = true; # make line numbering relative to cursor position
      numberwidth = 2; # set number column width to 2 {default 4}
      signcolumn = "yes"; # always show the sign column, otherwise it would shift the text each time
      wrap = false; # display lines as one long line
      scrolloff = 8; # minimal number of screen lines to keep above and below the cursor.
      sidescrolloff = 8; # minimal number of screen lines to keep left and right of the cursor.
      showcmd = false;
      ruler = false;
      virtualedit = "block"; # allow cursor to move where there is no text in visual block mode:wildmode
      smoothscroll = true;
      linebreak = true; # Wrap lines at convenient points
      mouse = "a"; # Enable mouse mode
      number = true; # Print line number
      pumblend = 10; # Popup blend
      pumheight = 10;
    };
  };
}
