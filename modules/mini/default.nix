{lib, ...}: let
  inherit (lib) enabled;
in {
  vim.mini = {
    ai = enabled;
    surround = enabled;
    icons = enabled;
    statusline = enabled;
  };
}
