{ config
, flake
, ...
}:
let
  # WARN: Does not work as expected
  # inherit (flake.inputs) self;
  # dotfilesHome = "${self}/home";
  dotfilesHome = "${config.home.homeDirectory}/Repositories/GitHub/dotfiles/home/nixos";
in
{
  home.file =
    {
      # WARN: Conflicts with podman
      # ".config/containers/registries.conf" = {
      #   source = config.lib.file.mkOutOfStoreSymlink "${dotfilesHome}/.config/containers/registries.conf";
      # };
      ".config/home-manager" = {
        recursive = true;
        source = config.lib.file.mkOutOfStoreSymlink "${dotfilesHome}/.config/home-manager";
      };
      ".config/kitty" = {
        recursive = true;
        source = config.lib.file.mkOutOfStoreSymlink "${dotfilesHome}/.config/kitty";
      };
      ".config/lazygit" = {
        recursive = true;
        source = config.lib.file.mkOutOfStoreSymlink "${dotfilesHome}/.config/lazygit";
      };
      ".config/navi" = {
        recursive = true;
        source = config.lib.file.mkOutOfStoreSymlink "${dotfilesHome}/.config/navi";
      };
      ".config/nvimpager" = {
        recursive = true;
        source = config.lib.file.mkOutOfStoreSymlink "${dotfilesHome}/.config/nvimpager";
      };
      ".config/tmux" = {
        recursive = true;
        source = config.lib.file.mkOutOfStoreSymlink "${dotfilesHome}/.config/tmux";
      };
      ".config/sketchybar" = {
        recursive = true;
        source = config.lib.file.mkOutOfStoreSymlink "${dotfilesHome}/.config/sketchybar";
      };
      ".bash_aliases" = {
        source = config.lib.file.mkOutOfStoreSymlink "${dotfilesHome}/.bash_aliases";
      };
      ".bashrc_extra" = {
        source = config.lib.file.mkOutOfStoreSymlink "${dotfilesHome}/.bashrc";
      };
      ".gitconfig" = {
        source = config.lib.file.mkOutOfStoreSymlink "${dotfilesHome}/.gitconfig";
      };
      ".inputrc" = {
        source = config.lib.file.mkOutOfStoreSymlink "${dotfilesHome}/.inputrc";
      };
      "bin" = {
        recursive = true;
        source = config.lib.file.mkOutOfStoreSymlink "${dotfilesHome}/bin";
      };
    };
}
