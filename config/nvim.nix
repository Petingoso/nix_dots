{ inputs, pkgs, ... }: {

  home.file."./.config/nvim" = {
source = ./nvim;
recursive = true;
  };
  # programs.neovim-flake = {
  #
  #   enable = false;
  #   # your settings need to go into the settings attribute set
  #   # most settings are documented in the appendix
  #   settings = {
  #     vim.lsp = { enable = true; };
  #     vim.languages = {
  #       clang.enable = true;
  #       markdown.enable = true;
  #       nix.enable = true;
  #
  #       imports = [./nvim/plugins.nix];
  #     };
  #   };
  # };
}
