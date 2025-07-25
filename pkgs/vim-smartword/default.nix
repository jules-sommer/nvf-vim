{
  buildVimPlugin,
  fetchFromGitHub,
  ...
}: (buildVimPlugin {
  pname = "vim-smartword";
  version = "2025-02-24";
  src = fetchFromGitHub {
    owner = "kana";
    repo = "vim-smartword";
    rev = "608d4883bb1eff4131f44857a21119220e55886d";
    hash = "sha256-ZIozhd2cg7JlykG0izV3hWgPdc/Zix8JzXc152cZDxk=";
  };
})
