{

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-20.09";

  outputs = { self, nixpkgs }: {

    defaultPackage.x86_64-linux = self.nixosConfigurations.minecraft-kiosk.config.system.build.isoImage;

    nixosConfigurations.minecraft-kiosk = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
        {
          disabledModules = [ "installer/cd-dvd/channel.nix" ];
        }
        ./minecraft.nix
      ];
    };

  };

}
