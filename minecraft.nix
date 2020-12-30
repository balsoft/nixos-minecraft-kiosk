{ config, pkgs, lib, ... }: {
  nixpkgs.config.allowUnfree = true;
  services.cage = {
    enable = true;
    user = "minecraft";
    program = "${pkgs.minecraft}/bin/minecraft-launcher";
  };
  environment.pathsToLink = [ "/share/X11" ];
  environment.systemPackages = [ pkgs.xwayland ];
  users.mutableUsers = false;
  users.users.minecraft = {
    isNormalUser = true;
    description = "Minecraft G4m3r";
  };
  services.mingetty.autologinUser = lib.mkForce "minecraft";
}
