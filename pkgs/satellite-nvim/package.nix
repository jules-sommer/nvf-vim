{pkgs, ...}: (pkgs.vimUtils.buildVimPlugin {
  pname = "satellite-nvim";
  version = "2024-08-19";
  src = pkgs.fetchFromGitHub {
    owner = "lewis6991";
    repo = "satellite.nvim";
    rev = "fc9672c9a14371ad948b5c42588d5ccfc4120f42";
    hash = "sha256-L1cKyTRpAC8ICzvm5iVy96p3/Gjaxa9CQOuLNUfxIAg=";
  };
})
