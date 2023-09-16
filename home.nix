{ config, pkgs, ... }: {
  import = [ ./config ];

  home.username = "petarch";
  home.homeDirectory = "/home/petarch/";

  home.stateVersion = "23.05"; # Please read the comment before changing.
  # environment.
  home.packages = [
    pkgs.nixfmt
  ];

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
