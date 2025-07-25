{
  lib,
  config,
  ...
}: let
  inherit
    (lib)
    enabled
    enabled'
    disabled
    disabled'
    ;
in {
  vim = {
    treesitter.context = disabled;

    fzf-lua = enabled;
    snippets.luasnip = enabled;

    lsp = enabled' {
      formatOnSave = true;
      lspSignature.enable = !config.vim.autocomplete.blink-cmp.enable;
    };
    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;

      zig = enabled;
      nix = enabled;
      markdown = enabled;

      bash = enabled;
      clang = enabled;
      css = enabled;
      html = enabled;
      sql = enabled;
      assembly = enabled;
      ts = enabled;
      ocaml = enabled;
      go = enabled;
      lua = enabled' {
        lsp = enabled;
        treesitter = enabled;
      };

      python = enabled;
      typst = enabled;
      rust = enabled' {
        crates = enabled;
      };
    };
  };
}
