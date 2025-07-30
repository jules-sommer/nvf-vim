_: rec {
  enabled = enabled' {};
  enabled' = extra:
    {
      enable = true;
    }
    // extra;

  disabled = disabled' {};
  disabled' = extra:
    {
      enable = false;
    }
    // extra;

  enabledLuaPlugin = opts: {
    enable = true;
    setupOpts = opts;
  };
}
