{pkgs, ...}: (pkgs.vimUtils.buildVimPlugin {
  pname = "oil-lsp-diagnostics";
  version = "2025-07-29";

  checkInputs = with pkgs.vimPlugins; [
    oil-nvim
  ];

  nvimRequireCheck = [
    "oil"
    "oil-lsp-diagnostics"
  ];
  src = pkgs.fetchFromGitHub {
    owner = "JezerM";
    repo = "oil-lsp-diagnostics.nvim";
    rev = "e04e3c387262b958fee75382f8ff66eae9d037f4";
    hash = "sha256-E8jukH3I8XDdgrG4XHCo9AuFbY0sLX24pjk054xmB9E=";
  };
})
