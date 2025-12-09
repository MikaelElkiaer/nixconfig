# Like GNU `make`, but `just` rustier.
# https://just.systems/
# run `just` from this directory to see available commands

# Default command when 'just' is run without arguments
default:
  @just --list

# Update nix flake
[group('Main')]
update:
  nix flake update

# Activate the configuration
[group('Main')]
run:
  nix run .#activate $USER@$HOSTNAME

# See home-manager news
[group('Main')]
news:
  home-manager --flake . news

# Log in to GitHub
[group('bootstrap')]
gh-login:
  gh auth login --hostname=github.com --git-protocol=https --scopes=notifications,read:packages,read:org,read:project

# Lint nix files
[group('dev')]
lint:
  nix fmt .

# Check nix flake
[group('dev')]
check:
  nix flake check

# Manually enter dev shell
[group('dev')]
dev:
  nix develop
