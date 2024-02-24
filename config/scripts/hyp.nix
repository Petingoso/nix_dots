{ self, config, pkgs, ... }:

{
  home.file.".local/bin/hyp" = {
    text = ''
       #!/bin/zsh
      cd ~

      mkdir -p /tmp/themes/kitty/
      mkdir -p /tmp/themes/rofi/
      mkdir -p /tmp/themes/hyprland/
      mkdir -p /tmp/themes/nvim/

      cp -r ${self}/config/kitty/* /tmp/themes/kitty/
      cp -r ${self}/config/rofi/colors/* /tmp/themes/rofi/
      cp -r ${self}/config/hyprland/themes/* /tmp/themes/hyprland/

      echo 'vim.cmd("colorscheme gruvbox")' >> /tmp/themes/nvim/theme

      chmod 775 -R /tmp/themes/

      /usr/bin/Hyprland
    '';
    executable = true;
    };
}
