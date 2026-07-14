# Tricky Store Booster

A lightweight Magisk/APatch module that automatically updates and keeps `target.txt` up-to-date for TrickyStore, or any fork that uses the same `/data/adb/tricky_store/target.txt` path and format.

Instead of dumping every installed package in `target.txt` (the original behaviour), this fork adds only the apps selected in Magisk's DenyList or APatch's Exclude List, plus a fixed list of packages you always want included.

## What it does

On boot (after the device is unlocked) and every 12 hours afterward, the module detects which root solution is active and updates `/data/adb/tricky_store/target.txt` accordingly:

| Root manager | Source of packages |
|---|---|
| **Magisk** | DenyList + Fixed Packages |
| **APatch** | Exclude List + Fixed Packages |

## Requirements

- **Magisk** or forks with `--denylist` CLI support, **or**
- **APatch** or forks, **and**
- **TrickyStore** or forks that use the same `/data/adb/tricky_store/target.txt` path and format

> **KernelSU and forks are blocked from installation.** The device I own is too old for KernelSU and its forks. It can only run Magisk or APatch (or their forks). This is the only reason for this behaviour.

> **Flashing in recovery is unsupported.** Installing outside the Magisk/APatch app (e.g. via TWRP) will abort with an error.

## Configuration

In case you want to edit the list of fixed packages that should be in `target.txt` irrespective of their status in DenyList/Exclude List, open `common.sh` and edit the `FIXED_PACKAGES` line near the top - a single, space-separated string of package names. Once done, replace the current `common.sh` with your modified version in the module zip and install via the Magisk/APatch app.

In case you have made changes to your DenyList/Exclude List and you want them to be replicated in `target.txt` immediately, there is an action button which should be visible in the Magisk/APatch app which can take care of it for you.

## Installation

1. Flash the module zip via the Magisk/APatch app.
2. Reboot.
3. Unlock your device.
4. `target.txt` will populate automatically about 10 seconds after unlock, and refresh every 12 hours from then on.

## Credits

- Forked from [Tricky Store Booster](https://github.com/Cycle1337/TrickyStoreBooster)
- [TrickyStore](https://github.com/5ec1cff/TrickyStore)
