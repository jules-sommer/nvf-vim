{
  vim.highlight = {
    BlinkCmpMenu.link = "Pmenu";
    BlinkCmpMenuBorder.fg = "#596170"; # blend(#3c4048, #7b8496, 0.7)
    BlinkCmpMenuSelection.bg = "#3c4048"; # bgHighlight
    BlinkCmpLabel.fg = "#ffffff"; # fg
    BlinkCmpLabelDeprecated = {
      fg = "#7b8496"; # grey
      strikethrough = true;
    };

    BlinkCmpLabelMatch.fg = "#5ef1ff"; # cyan
    BlinkCmpDoc.link = "NormalFloat";
    BlinkCmpDocBorder.link = "BlinkCmpMenuBorder";
    BlinkCmpDocCursorLine.link = "Visual";
    BlinkCmpSignatureHelp.link = "NormalFloat";
    BlinkCmpSignatureHelpBorder.link = "BlinkCmpMenuBorder";
    BlinkCmpSignatureHelpActiveParameter.fg = "#5ef1ff"; # cyan

    BlinkCmpKindText.fg = "#5eff6c"; # green
    BlinkCmpKindMethod.fg = "#5ea1ff"; # blue
    BlinkCmpKindFunction.fg = "#5ea1ff"; # blue
    BlinkCmpKindConstructor.fg = "#bd5eff"; # purple

    BlinkCmpKindField.fg = "#5eff6c"; # green
    BlinkCmpKindVariable.fg = "#ffbd5e"; # orange
    BlinkCmpKindProperty.fg = "#ff6e5e"; # red

    BlinkCmpKindClass.fg = "#5ea1ff"; # blue
    BlinkCmpKindInterface.fg = "#5ea1ff"; # blue
    BlinkCmpKindStruct.fg = "#5ea1ff"; # blue
    BlinkCmpKindModule.fg = "#5ea1ff"; # blue

    BlinkCmpKindUnit.fg = "#ffbd5e"; # orange
    BlinkCmpKindValue.fg = "#ffbd5e"; # orange
    BlinkCmpKindEnum.fg = "#ffbd5e"; # orange
    BlinkCmpKindEnumMember.fg = "#ffbd5e"; # orange

    BlinkCmpKindKeyword.fg = "#ff5ef1"; # magenta
    BlinkCmpKindConstant.fg = "#ff5ea0"; # pink

    BlinkCmpKindSnippet.fg = "#5eff6c"; # green
    BlinkCmpKindColor.fg = "#5eff6c"; # green
    BlinkCmpKindFile.fg = "#5eff6c"; # green
    BlinkCmpKindReference.fg = "#5eff6c"; # green
    BlinkCmpKindFolder.fg = "#5eff6c"; # green
    BlinkCmpKindEvent.fg = "#5eff6c"; # green
    BlinkCmpKindOperator.fg = "#ff5ef1"; # magenta
    BlinkCmpKindTypeParameter.fg = "#ff5ea0"; # pink
  };
}
