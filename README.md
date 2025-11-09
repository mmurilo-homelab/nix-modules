# nix-modules
nixos configuration


## Usage

```bash
cd /etc/nixos
git clone https://github.com/mmurilo-homelab/nix-modules.git
```

edit `configuration.nix`

```nix
{
...
  imports =
    [ # Include the results of the hardware scan.
      ...
      ./nix-modules/packages.nix
    ];
...
}
```

```nix
programs.git.enable = true;
```

rebuild

```bash
sudo nixos-rebuild switch --upgrade
```

## Flathub

```bash
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

## Maintenance

```bash
nix-collect-garbage
sudo nix-store --optimize
```

- To delete older than a specific time period: `sudo nix-collect-garbage --delete-older-than 7d`.
