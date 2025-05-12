> My NixOS configuration. Find my previous configuration here [ninthcircle/dotfiles-old](https://gitlab.com/ninthcircle/dotfiles-old.git).

---

## Getting Started

Install standalone `home-manager` by following this [documentation](https://home-manager.dev/manual/23.05/index.html#sec-install-standalone).

Then run the following commands to setup NixOS:

```bash
sudo nixos-reload switch --flake .
home-manager switch --flake .
```

Or, install to a fresh NixOS system with the following experimental script:

```bash
nix-shell -p git --command "nix run --experimental-features 'nix-command flakes' gitlab:ninthcircle/dotfiles"
```

## Clean up

Remove old generations and old boot menu options:

```bash
sudo nix-collect-garbage -d
sudo /run/current-system/bin/switch-to-configuration boot
```

## Bookmarks

- https://search.nixos.org/packages
- https://mynixos.com/

## References

- https://home-manager.dev/manual/23.05/index.html
- https://www.youtube.com/playlist?list=PL_WcXIXdDWWpuypAEKzZF2b5PijTluxRG
- https://gitlab.com/librephoenix/nixos-config
- https://www.reddit.com/r/NixOS/comments/10107km/comment/j2lekuj/
