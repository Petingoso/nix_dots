{ config, pkgs, ... }: {

  wayland.windowManager.hyprland.settings = {
    exec = [ "pkill waybar;/usr/bin/waybar &" ];
    exec-once = [
      "GDK_BACKEND=x11 pcloud"
      "xss-lock 'gtklock -i'"
      "swaync"
      "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
      "fcitx5"
      "opensnitch-ui"
      "wl-clip-persist"
      "/usr/lib/kdeconnectd"

      '' swayidle -w timeout 600  "playerctl pause & gtklock -i &" timeout 720  "systemctl suspend" ''
    ];

  };
}
