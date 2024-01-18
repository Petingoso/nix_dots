{ config, pkgs, ... }: {
  imports = [ ../../variables.nix ];

  wayland.windowManager.hyprland.settings = {
    "$mod" = "ALT";
    bindm = [ "$mod,mouse:272,movewindow" "$mod,,mouse:273,resizewindow" ];
    bind = [
      "$mod CONTROL, Q ,exit,"
      "$mod SHIFT, R, exec, hyprctl reload"
      "$mod, Space, togglefloating"
      "$mod, Q, killactive"
      "$mod, C, pseudo,"
      "$mod, F, fullscreen,"

      "$mod, G, ~/.local/bin/togglegaps"
      "$mod, Return, exec, /usr/bin/kitty -1"

      "$mod, B, exec, pkill -SIGUSR1 'waybar'"

      ",Print,exec,grim $HOME/Pictures/SS/$(date +'%Y%m%d%H%M%S_1.png') && notify-send 'Screenshot Saved'"

      "SUPER,Print,exec,grim - | wl-copy && notify-send 'Screenshot Copied to Clipboard'"

      "SUPERSHIFT,Print,exec,grim - | swappy -f -"

      "SUPERSHIFT,S,exec,slurp | grim -g - /tmp/photo && wl-copy < /tmp/photo && notify-send 'Screenshot Copied to Clipboard'"

      ''
        $mod SHIFT,S,exec,slurp | grim -g - /tmp/photo && swappy -f /tmp/photo
      ''

      "$mod, D, exec, ${config.rofi-menu}"
      "$mod, T, exec, .local/bin/theme_changer_WL"
      "$mod CONTROL, X, exec,~/.local/bin/powermenu"
      "$mod CONTROL, K, exec,~/.local/bin/hypr_bindings"

      "$mod CONTROL, E, hyprshade on blue-light-filter"
      "$mod CONTROL, R, hyprshade off"

      "$mod SHIFT, P, exec, gtklock -i"

      "$mod SHIFT, T, exec, swaync-client -t"

      "$mod, V, togglesplit"
      "$mod SHIFT, V, togglegroup"
      "$mod, N ,changegroupactive,f"
      "$mod SHIFT,N,changegroupactive,b"
      "$mod, S,layoutmsg,swapwithmaster"

      ",XF86MonBrightnessUp,exec,sudo light -A 10.2"
      ",XF86MonBrightnessDown,exec,sudo light -T 0.63"

      "$mod,P,exec,playerctl play-pause"
      ",XF86AudioRaiseVolume,exec,amixer set Master 5%+"
      ",XF86AudioLowerVolume,exec,amixer set Master 5%-"
      ",XF86AudioMute,exec,amixer -D pulse set Master 1+ toggle"
      ",XF86Calculator,exec,qalculate-gtk"

      "$mod, tab, workspace +1"
      "$mod SHIFT, tab, workspace -1"
      "$mod, period, focusmonitor,r"
      "$mod, comma, focusmonitor,l"
      "$mod SHIFT,period,movewindow,mon:r"
      "$mod SHIFT,comma,movewindow,mon:r"

      "$mod CONTROL,left,splitratio,-0.1"
      "$mod CONTROL,right,splitratio,+0.1"
      "$mod CONTROL,h,splitratio,-0.1"
      "$mod CONTROL,l,splitratio,+0.1"

      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"

      "$mod, h, movefocus, l"
      "$mod, l, movefocus, r"
      "$mod, k, movefocus, u"
      "$mod, d, movefocus, d"

      "$mod SHIFT, left, movewindow, l"
      "$mod SHIFT, right, movewindow, r"
      "$mod SHIFT, up, movewindow, u"
      "$mod SHIFT, down, movewindow, d"

      "$mod SHIFT, h, movewindow, l"
      "$mod SHIFT, l, movewindow, r"
      "$mod SHIFT, k, movewindow, u"
      "$mod SHIFT, d, movewindow, d"
    ] ++ (
      # workspaces
      # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
      builtins.concatLists (builtins.genList (x:
        let ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
        in [
          "$mod, ${ws}, workspace, ${toString (x + 1)}"
          "$mod SHIFT, ${ws}, movetoworkspacesilent, ${toString (x + 1)}"
        ]) 10));

  };
}
