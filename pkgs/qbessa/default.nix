{
  buildVimPlugin,
  fetchFromGitHub,
  ...
}: (buildVimPlugin {
  pname = "qbessa";
  version = "2025-01-20";
  src = fetchFromGitHub {
    owner = "sgraham";
    repo = "qbessa.vim";
    rev = "30ba21907d14bb95c36446460fc6afe6b3a3e90e";
    hash = "sha256-i+ppI7cEnLhlK1p0EHw6aR7Ljw1ay3Fs/7IDF4sp7pM=";
  };
})
