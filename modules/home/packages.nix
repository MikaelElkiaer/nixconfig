{ pkgs, ... }:
{
  home.packages = with pkgs; [
    atuin
    bats
    cargo
    # WARN: Comes with nix-unified
    # comma
    # WARN: Not supported by darwin
    # dagger
    delta
    docker-credential-helpers
    expect
    file
    fluxcd
    fzf
    gh
    gh-copilot
    gh-dash
    gh-markdown-preview
    git
    glow
    gnused
    go
    gotop
    gitmux
    gnumake
    htop
    hyperfine
    just
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
