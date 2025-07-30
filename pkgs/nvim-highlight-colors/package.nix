{pkgs, ...}:
pkgs.vimUtils.buildVimPlugin {
  pname = "nvim-highlight-colors";
  version = "2025-07-28";
  nvimRequireCheck = [
    "nvim-highlight-colors"
  ];
  src = pkgs.fetchFromGitHub {
    owner = "brenoprata10";
    repo = "nvim-highlight-colors";
    rev = "b42a5ccec7457b44e89f7ed3b3afb1b375bb2093";
    hash = "sha256-Zzgk6DG4jVnyudPNX2IidI/k9R1HrDvVKXQHr6tPhX8=";
  };
}
