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

### Stateless minecraft flash drive (build from any amd64 Linux distribution)

1. [Get Nix](https://nixos.org/download.html)
2. Get `nixUnstable`: `nix-shell -p nixUnstable`
3. Build the ISO: `nix build github:balsoft/nixos-minecraft-kiosk`
4. Flash the ISO (the sole file contained in `result/iso`) to a flash drive
   (I won't give any instructions here so that if you ruin your system, I'm
   not to blame)
5. Boot it!

Note that the resulting flash drive will be stateless (i.e. your progress
won't persist through reboots). If you want to make it stateful, some additional
work is needed.

### VM (only build from amd64 NixOS)

1. Get `nixUnstable`: `nix-shell -p nixUnstable`
2. `nixos-rebuild --build-vm github:balsoft/nixos-minecraft-kiosk#minecraft-kiosk`
3. Find `/nix/store/.../run-nixos-vm` in the last line of the output and
   run that command.
