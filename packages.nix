{ config, pkgs, ... }:

{
  imports = [];

  # install neovim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.git.enable = true;

  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    curl
    bat
    btop
    ipfetch
    fastfetch
    unzip
    dive
    podman-tui
    docker-compose
    distrobox
    ghostty
  ];

  services.flatpak.enable = true;

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

  # Aliases
  programs.bash.shellAliases = {
    vim = "nvim";
  };

}
