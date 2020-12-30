# NixOS-based "Distro" for running Minecraft

Made in 10 minutes for https://www.reddit.com/r/linux/comments/kmsexo/pure_minecraft_distro/

## Legal stuff

This is a non-commercial project made for fun, **it is not affiliated in
any way with Mojang**.

It does not redistribute software or assets belonging to Mojang, but merely
creates an unusual way for you to play the game. All software and assets
required are downloaded by the user from Mojang's servers during ISO/VM
build process.

However, I am not a lawyer, and if you represent Mojang and are unhappy
with this repository, make sure to notify me.

By building and using this, you accept [Minecraft EULA](https://account.mojang.com/documents/minecraft_eula)
and any other agreements required to download and run the game.

This project (i.e. the files contained in this repository) is in Public
Domain (see [LICENSE](./LICENSE)). Note however that some files required
to build and use this project have different licences. Make sure you read
and agree with them.

![CC0](https://i.creativecommons.org/p/zero/1.0/88x31.png)

## Usage

First of all, you will have to get Nix. The easiest way to do this is to
[use the installer script](https://nixos.org/download.html). Then you need
to get the unstable version of Nix with `nix-shell -p nixUnstable`. All
of the following operations should happen within that shell.


### Stateless minecraft flash drive

1. Build the ISO: `nix --experimental-features "flakes nix-command" build github:balsoft/nixos-minecraft-kiosk#isoImage`
2. Flash the ISO (the sole file contained in `result/iso`) to a flash drive
   (I won't give any instructions here so that if you ruin your system, I'm
   not to blame)
3. Boot it!

Note that the resulting flash drive will be stateless (i.e. your progress
won't persist through reboots). If you want to make it stateful, some additional
work is needed.

### VM

1. Build the VM start script: `nix --experimental-features "flakes nix-command" build github:balsoft/nixos-minecraft-kiosk#vm`
2. Run it: `./result/bin/run-minecraft-kiosk-vm`
