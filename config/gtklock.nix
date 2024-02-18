{ pkgs, ... }: {
  xdg.configFile."gtklock/config.ini".text = ''
    [main]
    modules=${pkgs.gtklock-playerctl-module.outPath}/lib/gtklock/playerctl-module.so
  '';
}
