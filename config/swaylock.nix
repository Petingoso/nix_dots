{ config, pkgs, ... }: {
programs.swaylock.enable = true;
programs.swaylock.package = pkgs.swaylock-effects;
  programs.swaylock.settings = {
    clock = true;
    indicator = true;
    indicator-radius = 90;
    indicator-thickness = 15;
    font-size = 25;
    screenshot = true;
    effect-blur = "30x10";
  };
}
