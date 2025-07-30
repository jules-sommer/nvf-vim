{pkgs, ...}:
pkgs.vimUtils.buildVimPlugin {
  pname = "deferred-clipboard";
  version = "2025-07-24";
  src = pkgs.fetchFromGitHub {
    owner = "EtiamNullam";
    repo = "deferred-clipboard.nvim";
    rev = "f58d9a20fe5d5891c61773814a1f3051ce43c006";
    hash = "sha256-HTk70Fb4n/F4nVkfxSKRsgrXnoFwMpSV276WvDt5uY0=";
  };
}
