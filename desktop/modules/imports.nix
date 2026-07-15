{ config, pkgs, ... }:

{
  # imports = [];

  # install neovim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.git.enable = true;

  environment.systemPackages = with pkgs; [
    bat
    btop
    curl
    distrobox
    dive
    docker-compose
    fastfetch
    ghostty
    gnome-tweaks
    ipfetch
    podman-tui
    unzip
    wget
#    nordic
#    home-manager
    gnomeExtensions.switcher
    gnomeExtensions.tiling-assistant
  ];

  services.flatpak.enable = true;
  #xdg.portal = {
  #  enable = true;
  #  extraPortals = [ pkgs.xdg-desktop-portal-cosmic pkgs.xdg-desktop-portal-gtk ];
  #  config.common.default = "*";
  #};

  programs.nix-ld.enable = true;
  #programs.nix-ld.libraries = with pkgs; [
  #  stdenv.cc.cc  # zed
  #];



  # Enable common container config files in /etc/containers
  virtualisation.containers.enable = true;
  virtualisation = {
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PasswordAuthentication = true;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = [ "mmurilo" ];
      MaxAuthTries = 3;
      PerSourcePenalties = "crash:3600s authfail:3600s max:86400s";
    };
  };

  boot.zswap = {
    enable = true; 
    # …
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Aliases
  programs.bash.shellAliases = {
    vim = "nvim";
  };


}
