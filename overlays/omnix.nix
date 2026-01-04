# WARN: Temporary fix, see:
# - https://github.com/juspay/omnix/issues/494
# - https://github.com/NixOS/nixpkgs/issues/475479
{ ... }:
self: super: {
  omnix = super.omnix.overrideAttrs (oldAttrs: {
    NIX_CFLAGS_COMPILE = "-std=gnu17";
  });
}
