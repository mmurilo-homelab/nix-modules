{config, pkgs, lib, ...}:

{
  boot.kernelModules = [ "wl" ];
  boot.extraModulePackages = [config.boot.kernelPackages.broadcom_sta];
  nixpkgs.config.allowInsecurePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "broadcom-sta" # aka “wl”
    ];

  #  nixpkgs.config.permittedInsecurePackages = [
  #    "broadcom-sta-6.30.223.271-57-6.12.54"
  #  ]; 
}