{ config, pkgs, ... }: {
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.enableNvidiaPatches = true;

  imports = [
    ./hyprland/binds.nix
    ./hyprland/exports.nix
    ./hyprland/settings.nix
    ./hyprland/startup.nix
  ];
}
