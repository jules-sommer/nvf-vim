{theme, ...}: {
  vim.highlight = {
    NormalFloat = {
      blend = 10;
    };
    InlayHint = {
      bg = theme.transparent;
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
      fg = "#451840";
      bg = null;
    };
    WhichKey.link = "NormalFloat";
    WhichKeyBorder.link = "FloatBorder";
    MsgArea.link = "NormalFloat";
    NotifyBackground.link = "FloatBorder";
    FloatFooter.link = "FloatBorder";
    FloatTitle.link = "FloatBorder";
  };
}
