{ config, pkgs, lib, ... }: {
  imports = [ ./config ];

  home.username = "petarch";
  home.homeDirectory = "/home/petarch/";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  # environment.
  home.packages =
    [ pkgs.nixfmt pkgs.ranger pkgs.papirus-icon-theme pkgs.pam pkgs.zinit pkgs.nh];

  home.sessionVariables = { LANG = "en_GB.utf-8"; FLAKE = "/home/petarch/nixfiles/";};
 home.file = {
   ".icons".source = "${builtins.getEnv "HOME"}/.nix-profile/share/icons";
 };

  gtk.iconTheme = {
    package = pkgs.papirus-icon-theme;
    name = "Papirus-Dark";
  };

  home.sessionVariables.LOCALES_ARCHIVE =
    "${pkgs.glibcLocales}/lib/locale/locale-archive";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
