{ self, lib, ... }: {
  options = with lib;
    with types; {
      lock_cmd = mkOption { type = str; };
      rofi-menu = mkOption { type = str; };
      };
      config = {
        lock_cmd = "playerctl pause; /usr/bin/hyprlock";
        rofi-menu =
          "/usr/local/bin/rofi -show drun -theme ${self}/config/rofi/launchers/menu.rasi";
      };
}
