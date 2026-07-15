{ config, pkgs, lib, modulesPath, ... }:

{
  #imports = [ 
  #  (modulesPath + "/profiles/qemu-guest.nix") 
  #];

  # Enable QEMU Guest Agent for Proxmox
  services.qemuGuest.enable = true;

   # Ensure the latest microcode is installed
  hardware.graphics.enable = true;
  #hardware.graphics.driSupport32Bit = true; # Recommended for Steam/WINE

  # Ensure the amdgpu kernel module is loaded at boot
  boot.initrd.kernelModules = [ "amdgpu" ];

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  # Enable AMD GPU drivers and 32-bit support (vital for Steam/Proton)
  hardware.amdgpu.initrd.enable = true;
  #services.xserver.videoDrivers = [ "modesetting" ];
  #hardware.opengl.enable = true; 
  #hardware.opengl.driSupport32Bit = true;
}

