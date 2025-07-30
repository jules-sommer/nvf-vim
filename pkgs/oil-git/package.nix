{pkgs, ...}: (pkgs.vimUtils.buildVimPlugin {
  pname = "oil-git";
  version = "2025-07-29";
  src = pkgs.fetchFromGitHub {
    owner = "benomahony";
    repo = "oil-git.nvim";
    rev = "3abffa67597aab5f915816d71e96cbed76147016";
    hash = "sha256-uuGXGHr/7k7YArefuj85qkMEHS54uPwjMVerywQxkkY=";
  };
})
