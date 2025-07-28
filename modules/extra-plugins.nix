{pkgs, ...}: {
  vim.extraPlugins = {
    blink-cmp.package = pkgs.vimPlugins.blink-cmp;
    qbessa.package = pkgs.extraVimPlugins.qbessa;
    vim-wordmotion.package = pkgs.extraVimPlugins.vim-wordmotion;
    vim-smartword.package = pkgs.extraVimPlugins.vim-smartword;
    deferred-clipboard.package = pkgs.extraVimPlugins.deferred-clipboard;
    "mini.tabline" = {
      package = "mini-tabline";
      setup = "require('mini.tabline').setup()";
    };
  };
}
