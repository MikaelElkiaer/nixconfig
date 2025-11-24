{ config
, lib
, pkgs
, ...
}:
{
  launchd.agents = {
    gh-notifications-counter = {
      config = {
        EnvironmentVariables = {
          PATH = "${
            lib.makeBinPath [
              pkgs.bash
              pkgs.gh
              pkgs.uutils-coreutils-noprefix
            ]
          }:/usr/local/bin:/usr/bin";
        };
        Program = "${config.home.homeDirectory}/bin/gh-notifications-counter";
        RunAtLoad = true;
        StartInterval = 60;
      };
      enable = true;
    };
    login-status-aws = {
      config = {
        EnvironmentVariables = {
          AWS_PROFILE = "${config.home.sessionVariables.AWS_PROFILE}";
          PATH = "${
            lib.makeBinPath [
              pkgs.awscli2
              pkgs.bash
              pkgs.uutils-coreutils-noprefix
            ]
          }:/usr/local/bin:/usr/bin";
        };
        Program = "${config.home.homeDirectory}/bin/login-status-aws";
        RunAtLoad = true;
        StartInterval = 60;
      };
      enable = true;
    };
    login-status-lps = {
      config = {
        EnvironmentVariables = {
          PATH = "${
            lib.makeBinPath [
              pkgs.bash
              pkgs.uutils-coreutils-noprefix
            ]
          }:/opt/homebrew/bin:/usr/local/bin:/usr/bin";
        };
        Program = "${config.home.homeDirectory}/bin/login-status-lps";
        RunAtLoad = true;
        StartInterval = 60;
      };
      enable = true;
    };
  };
  systemd.user = {
    services = {
      gh-notifications-counter = {
        Install.WantedBy = [ "default.target" ];
        Service = {
          Environment = [
            "PATH=${
              lib.makeBinPath [
                pkgs.bash
                pkgs.gh
              ]
            }:/usr/local/bin:/usr/bin"
          ];
          ExecStart = "${config.home.homeDirectory}/bin/gh-notifications-counter";
        };
        Unit.Description = "Count GitHub notifications";
      };
      login-status-aws = {
        Install.WantedBy = [ "default.target" ];
        Service.ExecStart = "${config.home.homeDirectory}/bin/login-status-aws";
        Unit.Description = "Set login status for AWS";
      };
      login-status-gkd = {
        Install.WantedBy = [ "default.target" ];
        Service.ExecStart = "${config.home.homeDirectory}/bin/login-status-gkd";
        Unit.Description = "Set login status for gnome-keyring-daemon";
      };
    };
    timers = {
      gh-notifications-counter = {
        Install.WantedBy = [ "timers.target" ];
        Timer = {
          OnCalendar = "*-*-* *:*:00";
          Persistent = true;
        };
        Unit.Description = "Count GitHub notifications every minute";
      };
      login-status-aws = {
        Install.WantedBy = [ "timers.target" ];
        Timer = {
          OnCalendar = "*-*-* *:*:00";
          Persistent = true;
        };
        Unit.Description = "Run login status for AWS every minute";
      };
      login-status-gkd = {
        Install.WantedBy = [ "timers.target" ];
        Timer = {
          OnCalendar = "*-*-* *:*:00";
          Persistent = true;
        };
        Unit.Description = "Run login status for keyring every minute";
      };
    };
  };
}
