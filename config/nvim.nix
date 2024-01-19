{ inputs,pkgs, ... }: {
  programs.neovim-flake = {

    enable = true;
    # your settings need to go into the settings attribute set
    # most settings are documented in the appendix
    settings = {
      vim.lsp = { enable = true; };
    };
  };
}
