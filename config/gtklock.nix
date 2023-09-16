{ pkgs, ... }: {
  xdg.configFile."gtklock/config.ini".text = ''
    [main]
    modules=${pkgs.gtklock-playerctl-module.outPath}/playerctl-module.so
  '';
}
