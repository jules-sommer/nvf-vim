{theme, ...}: {
  vim.highlight = {
    NormalFloat = {
      bg = theme.none;
      blend = 10;
    };
    # Comment        xxx cterm=italic gui=italic guifg=#565f89

    Comment = {
      italic = false;
      fg = theme.comment;
    };

    "@keyword" = {
      fg = theme.magenta;
      italic = false;
      bold = true;
    };

    LspInlayHint = {
      bg = theme.none;
      fg = theme.comment;
      bold = true;
      blend = 20;
    };
    StatusLine = {
      bg = null;
    };
    BlinkCmpDoc.link = "NormalFloat";
    BlinkCmpDocBorder.link = "FloatBorder";
    Pmenu.link = "NormalFloat";
    PmenuSel = {
      bg = "#ffffff";
    };
    FloatBorder = {
      fg = theme.magenta;
      bg = theme.none;
    };

    WhichKey.link = "NormalFloat";
    WhichKeyBorder.link = "FloatBorder";
    MsgArea.link = "NormalFloat";
    NotifyBackground.link = "FloatBorder";
    FloatFooter.link = "FloatBorder";
    FloatTitle.link = "FloatBorder";
  };
}
