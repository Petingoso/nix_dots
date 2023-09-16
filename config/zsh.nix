{ ... }: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      chroot = "TERM=xterm-256color chroot";
      eza = "eza -x --icons";
      ls = "eza -x --icons";
      v = "nvim";
      vc = "nvim ~/Coding";
      vn = "cd ~/Documents/Notes/ && nvim ~/Documents/Notes/index.md";
      vj = "nvim -c WikiJournal";
      cn = "cd ~/Documents/Notes";
      make = "make -j$(nproc)";
      touhou6 =
        "cd ~/Games/Touhou 6  - The Embodiment of Scarlet Devil/ && LANG=ja_JP.UTF-8 wine thprac v2.0.8.3.exe";
      xgo = "xdg-open";
      kcli = "kdeconnect-cli -n M2012K11AG";
      sgcc =
        "g++ -Werror -pedantic-errors -ggdb -Wall -Weffc++ -Wextra -Wsign-conversion -std=c++20";
      ssh = "kitty +kitten ssh";
    };
  };

  home.file.".zshrc".source = ./zsh/zshrc;
  home.file.".p10k.zsh".source = ./zsh/p10k.zsh;
}
