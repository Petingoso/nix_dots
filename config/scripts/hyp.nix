{ self,config, pkgs, ... }:

{
 home.file."myScript.sh".text = ''
 #!/bin/sh
cd ~
# export LIBVA_DRIVER_NAME=nvidia
export CLUTTER_BACKEND=wayland
export XDG_SESSION_TYPE=wayland
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export MOZ_ENABLE_WAYLAND=1
# export GBM_BACKEND=nvidia-drm
# export __GLX_VENDOR_LIBRARY_NAME=nvidia
export WLR_NO_HARDWARE_CURSORS=1
export WLR_BACKEND=vulkan
export GDK_BACKEND=wayland
# export XWAYLAND_NO_GLAMOR=1
mkdir -p /tmp/themes/{kitty,rofi}
cp -r ${self}/config/kitty/* /tmp/themes/kitty/
cp -r ${self}/config/rofi/colors/* /tmp/themes/rofi/
exec dbus-launch --sh-syntax --exit-with-session Hyprland
 '';
}
