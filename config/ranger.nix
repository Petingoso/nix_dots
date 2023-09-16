{ ... }: {
  xdg.configFile."ranger/commands.py".source = ./ranger/commands.py;
  xdg.configFile."ranger/rc.conf".source = ./ranger/rc.conf;
  xdg.configFile."ranger/rifle.conf".source = ./ranger/rifle.conf;
  xdg.configFile."ranger/plugins/ranger_archives".source =
    fetchGit { url = "https://github.com/maximtrp/ranger-archives"; };
  xdg.configFile."ranger/plugins/ranger_devicons".source =
    fetchGit { url = "https://github.com/alexanderjeurissen/ranger_devicons"; };
}
