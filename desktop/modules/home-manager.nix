{ config, pkgs, lib, ... }:

let
  home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-26.05.tar.gz;
#  plasma-manager =  builtins.fetchTarball  https://github.com/nix-community/plasma-manager/archive/trunk.tar.gz;
in
{
  imports =
    [
      (import "${home-manager}/nixos")
    ];

  #nix.nixPath = [
  #  "home-manager=https://github.com/nix-community/home-manager/archive/release-26.05.tar.gz"
  #];  

  #home-manager.startAsUserService = true;
  #users.users.mmurilo.isNormalUser = true;

#  environment.systemPackages = with pkgs; [
#    nordic
#    home-manager
#  ];

#  home-manager = {
#    useGlobalPkgs = true;
#    useUserPackages = true;
#    
#    sharedModules = [
#      (import "${plasma-manager}/modules")
#    ];
#
#    users.mmurilo = { pkgs, ... }: {
#      home.stateVersion = "26.05"; # Match your current NixOS version
#      #home.packages = [ 
#      #  pkgs.nordic
#      #	home-manager
#      #];
#      programs.bash.enable = true;
#      # 7. Use Plasma Manager configurations safely here
#      #programs.plasma = {
#      #  enable = true;
#      #  workspace.lookAndFeel = "custom.Nordic";
#      #};
#    };
#  };

}

