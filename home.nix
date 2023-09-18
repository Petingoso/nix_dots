{ config, pkgs, lib, ... }: {
  imports = [ ./config ];

  home.username = "petarch";
  home.homeDirectory = "/home/petarch/";

  home.stateVersion = "23.05"; # Please read the comment before changing.
  # environment.
  home.packages =
    [ pkgs.nixfmt pkgs.gtklock pkgs.ranger pkgs.papirus-icon-theme pkgs.zinit pkgs.pam ];

  home.sessionVariables = { LC_ALL = "C.utf-8"; };
  home.file = { ".icons".source = ~/.nix-profile/share/icons; };

  gtk.iconTheme = {
    package = pkgs.papirus-icon-theme;
    name = "Papirus-Dark";
  };

  home.sessionVariables.LOCALES_ARCHIVE =
    "${pkgs.glibcLocales}/lib/locale/locale-archive";


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
