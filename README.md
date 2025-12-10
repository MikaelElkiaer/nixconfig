# nixconfig

My personal OS and home configurations.

## Bootstrapping

```bash
# Install nix
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install --no-confirm --extra-conf "trusted-users = $(id -un)"

# Enable experimental features
mkdir -p ~/.config/nix/
echo 'extra-experimental-features = flakes nix-command' > ~/.config/nix/nix.conf

# Clone this repository
git clone https://github.com/mikaelelkiaer/nixconfig.git
cd nixconfig

# MacOS: Before first time activating
sudo mv /etc/nix/nix.conf /etc/nix/nix.conf.before-nix-darwin

# Activate the configuration
# - first time, after which use `just run`
nix run .#activate $USER@$HOSTNAME

# Log in to GitHub in order to push changes
just gh-login
```
