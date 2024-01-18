{ self, config, pkgs, ... }:

{
  home.file.".local/bin/hyp" = {
    text = ''
       #!/bin/sh
      cd ~
      mkdir -p /tmp/themes/{kitty,rofi}
      cp -r ${self}/config/kitty/* /tmp/themes/kitty/
      cp -r ${self}/config/rofi/colors/* /tmp/themes/rofi/
      exec dbus-launch --sh-syntax --exit-with-session Hyprland
    '';
    executable = true;
    };
}
