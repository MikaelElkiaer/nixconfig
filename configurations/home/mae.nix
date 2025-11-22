{ flake, ... }:
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

  home.stateVersion = "24.11";
}
