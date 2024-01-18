{ self, config, pkgs, ... }:

{
  home.file.".local/bin/hyp" = {
    text = ''
       #!/bin/sh
      cd ~

      mkdir -p /tmp/themes/kitty/
      mkdir -p /tmp/themes/rofi/
      mkdir -p /tmp/themes/hyprland/

      cp -r ${self}/config/kitty/* /tmp/themes/kitty/
      cp -r ${self}/config/rofi/colors/* /tmp/themes/rofi/
      cp -r ${self}/config/hyprland/themes/* /tmp/themes/hyprland/
      exec dbus-launch --sh-syntax --exit-with-session Hyprland
    '';
    executable = true;
    };
}
