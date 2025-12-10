{ config, flake, pkgs, ... }:
let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [
    self.homeModules.default
  ];

  # Defined by /modules/home/me.nix
  # And used all around in /modules/home/*
  me = {
    username = "mae";
    fullname = "Mikael Elkiaer";
    email = "mae@mae-mac-G00T0L7FPY";
  };

  # #
  # Copied from dotfiles
  # #

  home.packages = with pkgs; [
    aws-iam-authenticator
    awscli2
    crane
    grizzly # Grafana manager - with jsonnet support
    ic
    jsonnet
    jsonnet-bundler
    kubelogin # Azure
    kubelogin-oidc
    terraform
    vault-bin
    vault-medusa
    velero
  ];

  home.sessionVariables = {
    AWS_PROFILE = "netic-iam-mfa";
    GOOGLE_CLOUD_PROJECT = "netic-code-assist";
    VAULT_ADDR = "https://vault.shared.k8s.netic.dk";
    XDG_CACHE_HOME = "/Users/${config.me.username}/.cache";
    XDG_CONFIG_HOME = "/Users/${config.me.username}/.config";
    XDG_DATA_HOME = "/Users/${config.me.username}/.local/share";
    XDG_STATE_HOME = "/Users/${config.me.username}/.local/state";
  };

  home.stateVersion = "24.11";
}
