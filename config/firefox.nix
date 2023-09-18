{ config, pkgs, theme, ... }: {
  imports = [ ./firefox/arkenfox-nixos/default.nix ];

  programs.firefox = {
    enable = true;
    arkenfox.enable = true;
    arkenfox.version = pkgs.firefox.version;
    profiles.Default.arkenfox = {
      enable = true;
      "0008"."0804"."browser.search.suggest.enabled".value = true;
      "0028"."2811"."privacy.cpd.history".value = false;
      "0028"."2820"."privacy.clearOnShutdown.history".value = false;
      "0050"."5001"."browser.privatebrowsing.autostart".value = false;
      "0050"."5013"."places.history.enabled".value = true;
      "0050"."5021"."keyword.enabled".value = true;
    };

    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraPolicies = {
        CaptivePortal = false;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DisableFirefoxAccounts = false;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        OfferToSaveLoginsDefault = false;
        PasswordManagerEnabled = false;
        FirefoxHome = {
          Search = true;
          Pocket = false;
          Snippets = false;
          TopSites = false;
          Highlights = false;
        };
        UserMessaging = {
          ExtensionRecommendations = false;
          SkipOnboarding = true;
        };
      };
    };
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      ublock-origin
      bitwarden
      tree-style-tab
      tst-search
      tst-fade-old-tabs
      auto-tab-discard
      chameleon-ext
      darkreader
      skip-redirect
      noscript
      pywalfox
      s3_translator
      tab-session-manager
      violentmonkey
      yomichan

    ];
    xdg.configFile."firefox/treestyle-tab.json".source = ./firefox/config.json;
    profiles = {
      pet = {
        id = 0;
        name = "pet";
        search = {
          force = true;
          default = "Startpage";
          engines = {
            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }];
              icon =
                "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
            };
            "NixOS Wiki" = {
              urls = [{
                template = "https://nixos.wiki/index.php?search={searchTerms}";
              }];
              iconUpdateURL = "https://nixos.wiki/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [ "@nw" ];
            };
            "Wikipedia (en)".metaData.alias = "@wiki";
            "Google".metaData.hidden = true;
            "Amazon.com".metaData.hidden = true;
            "Bing".metaData.hidden = true;
            "eBay".metaData.hidden = true;
          };
        };
        settings = { "general.smoothScroll" = true; };
        extraConfig = ''
          user_pref("media.autoplay.enabled.user-gestures-needed",false)
          user_pref("ui.systemUsesDarkTheme", 1);
          user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
          user_pref("full-screen-api.ignore-widgets", true);
          user_pref("media.ffmpeg.vaapi.enabled", true);
          user_pref("media.rdd-vpx.enabled", true);
        '';
        userChrome = ''
          #TabsToolbar {
            visibility: collapse;
          }
        '';
        userContent = "";
      };
    };
  };
}
