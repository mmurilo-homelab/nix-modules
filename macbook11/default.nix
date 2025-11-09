{ lib, config, ... }:

{
  imports = [
    "${builtins.fetchGit { url = "https://github.com/NixOS/nixos-hardware.git"; }}/common/cpu/intel/haswell"
    ./wifi
    ../packages.nix
  ];

  boot.blacklistedKernelModules = lib.optionals (!config.hardware.enableRedistributableFirmware) [
    "ath3k"
  ];

  hardware.enableRedistributableFirmware = lib.mkDefault true;
  hardware.facetimehd.enable = lib.mkDefault (config.nixpkgs.config.allowUnfree or false);
  hardware.facetimehd.withCalibration = true;

  services.mbpfan.enable = lib.mkDefault true;
  services.fstrim.enable = lib.mkDefault true;
  services.tlp.enable = lib.mkDefault (
    (lib.versionOlder (lib.versions.majorMinor lib.version) "21.05")
    || !config.services.power-profiles-daemon.enable
  );

  environment.variables = {
    GSK_RENDERER = "gl";
  };
}
