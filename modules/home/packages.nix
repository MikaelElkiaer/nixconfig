{ pkgs, flake, ... }:
let
  inherit (flake.inputs) self;
  custom = self.packages.${pkgs.system};
in
{
  home.packages = with pkgs; [
    atuin
    bats
    cargo
    # WARN: Comes with nix-unified
    # comma
    # TODO: Re-enable using nixos-unified
    # dagger
    delta
    custom.docker-credential-ghcr-login
    docker-credential-helpers
    entr
    expect
    file
    fluxcd
    fzf
    gemini-cli
    github-copilot-cli
    gh
    gh-dash
    gh-markdown-preview
    git
    glow
    gnused
    go
    gotop
    gitmux
    gnumake
    just
    htop
    hyperfine
    kind
    k9s
    krew
    kubectl
    kubectl-validate
    (wrapHelm kubernetes-helm {
      plugins = [
        kubernetes-helmPlugins.helm-diff
      ];
    })
    kubeseal
    kubeswitch
    lazygit
    lnav
    navi
    ncurses
    nix-init
    nodejs
    pigz
    pluto
    podman
    python3
    ripgrep
    skopeo
    tlrc # tldr (Rust)
    tmux
    tree
    trivy
    unzip
    update-nix-fetchgit
    uutils-coreutils-noprefix
    viddy
    wget
    xclip
    xsel
    xdg-utils
    yank
    yq-go
    zoxide
    # INFO: nixos-unified-template defaults
    omnix
    # Nix dev
    cachix
    nil # Nix language server
    nix-info
    nixpkgs-fmt
  ];
}
