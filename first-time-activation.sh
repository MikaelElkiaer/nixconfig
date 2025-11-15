#!/usr/bin/env sh

sudo mv /etc/nix/nix.conf /etc/nix/nix.conf.before-nix-darwin
nix --extra-experimental-features "nix-command flakes" run
