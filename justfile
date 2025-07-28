run output="default":
  nix run .#{{output}}

build output="default":
  nix build .#{{output}}

fetcher command="--help":
  nix run nixpkgs#nurl -- {{command}}

debug-init-lua file="./.debug/debug_init.lua":
	nix eval --impure --raw --expr 'let flake = builtins.getflake "'$(pwd)'"; in builtins.tostring flake.packages.x86_64-linux.default.neovimconfig.builtluaconfigrc' > {{file}}

repl:
  nix repl --expr 'builtins.getFlake "'$(pwd)'"'

show:
  nix flake show

check:
  nix flake check
