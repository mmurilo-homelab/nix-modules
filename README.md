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

rebuild

```bash
sudo nixos-rebuild switch --upgrade
```

