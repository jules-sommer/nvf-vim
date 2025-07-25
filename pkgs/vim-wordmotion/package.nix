{pkgs, ...}: (pkgs.buildVimPlugin {
  pname = "vim-wordmotion";
  version = "2025-07-24";
  src = pkgs.fetchFromGitHub {
    owner = "chaoren";
    repo = "vim-wordmotion";
    rev = "81d9bd298376ab0dc465c85d55afa4cb8d5f47a1";
    hash = "sha256-2rTYzg5arjZXim9T+WfDWb5CIA2iN7gIuthcvqifhMk=";
  };
})
