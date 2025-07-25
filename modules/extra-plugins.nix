{pkgs, ...}: {
  vim = {
    startPlugins = with pkgs.extraVimPlugins; [
      vim-wordmotion
      vim-smartword
    ];

    extraPlugins = {
      qbessa.package = pkgs.extraVimPlugins.qbessa;
      vim-wordmotion.package = pkgs.extraVimPlugins.vim-wordmotion;
      vim-smartword.package = pkgs.extraVimPlugins.vim-smartword;
      "mini.tabline" = {
        package = "mini-tabline";
        setup = "require('mini.tabline').setup()";
      };
    };
  };
}
