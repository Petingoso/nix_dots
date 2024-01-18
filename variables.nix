{self, config, pkgs, lib, ... }:
{
  options = with lib; with types; {
    rofi-menu = mkOption { type = str; };
  };
  config = {
    rofi-menu =
      "/usr/local/bin/rofi -show drun -theme ${self}/config/rofi/launchers/menu.rasi";
  };
}
