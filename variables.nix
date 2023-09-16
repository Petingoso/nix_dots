{ config, pkgs, lib, ... }:
{
  options = with lib; with types; {
    rofi-menu = mkOption { type = str; };
  };
  config = {
    rofi-menu =
      "${pkgs.rofi}/bin/rofi -show drun -theme ~/.config/rofi/launchers/menu.rasi";
  };
}
