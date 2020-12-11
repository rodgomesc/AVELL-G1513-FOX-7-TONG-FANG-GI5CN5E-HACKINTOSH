# Hackintosh for Avell G1513 FOX-7 (Hasee TongFang GI5CN5E)

Based on the work of [Rodrigo Gomes](https://github.com/rodgomesc) and [Yume Maruyama](https://github.com/kirainmoe).

## Warning: This fork is no longer being maintained!

Due to an issue with the laptop I used for working on this fork (in a nutshell, its motherboard died) I won't be maintaining this fork anymore. I hope you all understand that!

Cheers, Matt.

## BIOS settings

These are the settings that are confirmed to work on this model:

### Advanced

**OS Support:** UEFI OS

**Wake on LAN:** Enabled

**SATA Mode Selection:** AHCI

**Intel Virtualization Technology:** Enabled

### Security

**Secure Boot:** Disable

### Boot

**Launch CSM:** Disable

**LAN Remote Boot:** Disabled

## Preparation

These were mainly transcripted/translated from the original [instruction video](https://www.bilibili.com/video/av81263778) and [instruction page](https://hackintosh.kirainmoe.com/an-zhuang-zhong/macos-an-zhuang-jian-ming-jiao-cheng). The original written guide has some important information on it, so please **take your time to read it, before trying the following steps**, you have been warned.

Boot into your Windows installation (running on the target laptop) and follow these steps:

### System Preparation

- An USB mouse, since no trackpads are supported on install
- An USB wi-fi adapter, since the built-in Intel AC 9560 won't work 
- An GPT-formatted disk, with a EFI partition of at least 200MB
- At least 30GB of free disk space (I personally recommend an SSD)
- An 8GB+ USB 2.0 stick (I'm workin with a 32GB one, but 16GB should fit perfectly)
- Backup!

### Required Tools

- [Balena Etcher](https://www.balena.io/etcher/)
- [Latest image of macOS Installer](https://blog.daliansky.net/)

## Disk Setup (Windows), optional

If you happen to be installing on a second SSD, you can prepare it correctly for GPT/EFI from Windows:

1. Open Disk Management (Win + X -> Disk Management)
2. Locate your target SSD, you can check if it's the correct drive by looking at the disk size
3. Remove any existing partitions (again, **backup your data if you have anything important there**)
4. Right-click the disk, select "Convert to GPT Disk". If it says "Convert to MBR Disk" then your disk already is GPT
5. Right-click the "Unallocated" area and select "New Simple Volume", size it anywhere between 200MB and 300MB and you should be fine. Format it as FAT32 and name it "EFI". Take note of the assigned letter of this partition (in my case it was A:)
6. Open CMD as administrator, run `bcdboot %WINDIR% /s A:`, replacing the A: with your assigned drive letter
7. Copy the files from this repo over to the `A:/EFI` directory (remove the old ones first, replace the A: with your drive letter)
8. Congratulations, you got OpenCore and everything else installed!

## Creating the USB Drive

1. Open balenaEtcher and select your disk image, burn it to your flash drive
2. Check if a new partition was created containing the EFI directory, rename it to something like EFI-BACKUP and copy over the `A:/EFI` directory. This will ensure our OpenCore installation gets used
3. Cross your fingers, unplug the flash drive and reboot
4. You should be greeted by OpenCore's boot screen, if this doesn't happen, change your boot priorities so that your first boot is from "UEFI OS"

## Installing macOS: Part 1

1. Now that you're in the OS selection screen, plug the flash drive. It will update and show the option "Install macOS". Select it
2. Wait for a little, lots of text will show, maybe even warnings, what matters here is getting to the language selection screen
3. When there, you will find yourself on the "macOS Utilities" screen, from recovery. Select "Disk Utility"
4. Click the button above the "View" text, select "Show All Devices"
5. Select your SSD, at this point you **may** find some issue where it won't show all available space, but don't worry, select "Erase". Name it EFI, select FAT (MSDOS) as the type. Now, select it, go over to "Partition"
6. Set it up so that the first partition of your drive is called "EFI" and is of type "MS-DOS (FAT)". It should have somewhere in between 200MB and 300MB. After this, create an APFS partition, give it a name (in my case, I used "Hackintosh" :D) and partition the rest of the disk however your feel nicer. I'm using half of it for macOS and half of it for "Other OS (ExFAT), so that I can share files across my OS'es
7. Click "Apply" and then "Partition". If for some reason it fails (it normally does), create the partitions as "MacOS Journaled" and then right-click each one, select "Erase" and set them up as you desire.
8. Now, close the Disk Utility. You will go back to the menu, select "Install macOS", "Continue", "Agree" and finally, select the drive you will be installing it to (Hackintosh, in my case). Click "Install" and wait for it
9. At this point you probably rebooted and either went to the flash drive bootloader (which is not what we want) or something didn't work at all. Let's fix this

## Installing macOS: Part 2

Select "Boot macOS Install from Hackintosh" (or whatever your drive name is) and you should see the familiar screen you saw the first time you booted from the flash drive, then possibly the Apple logo. Stay calm, it's completely normal! You should be back into the installer in no time.

Again, wait for it to finish. After rebooting you should be asked to set-up your Mac. Congratulations, you now have a Hackintosh.

## Wireless and stuff

There's a very big chance your wireless card isn't supported (if you have an 9560AC like me, you're out of luck). But, you should be able to grab a very cheap USB adapter and use it with your Mac, just install the appropriate drivers. In my case, I'm using one that uses the "Realtek 8188" chipset and the following drivers: https://github.com/chris1111/Wireless-USB-Adapter

### Experimental workaround for Intel Wireless

If you're feeling luck, you can try running the `wireless-setup.sh` (run it as sudo!) contained on your EFI root. It will customize a build of [AppleIntelWiFi](https://github.com/AppleIntelWifi/adapter) so that your network is connected properly. It's not a 100% thing, but an alternative to buying a new adapter.

This alternative is currently WIP and is not 100% implemented, **crashes may and will happen**.

## Keyboard Layouts

If you're like me and your laptop has an ABNT2 keyboard, then you may find that, for some reason, a few keys aren't working as expected. AltGR is mapped as Command, but most of the things you would use it for (specifically, the / and ? characters), can be accessed by Option (like Option + Q for / and Option + W for ?).

For a few others keys, like `\|` and `'"`, I've generated an keyboard mapping on Ukelele, which is available on the `keyboard-layout` directory. Simply install it for the current user and you should be able to use your keyboard normally again!

## And that's it, folks!

Thanks so much to the Hackintosh community for making this guide possible, specially [Rodrigo Gomes (@rodgomesc)](https://github.com/rodgomesc) and [Yume Maruyama (@kirainmoe)](https://github.com/kirainmoe) for providing such useful guides and tools for getting this up and running. 

If you feel like checking out the original project, please head over to https://github.com/kirainmoe/hasee-tongfang-macos. It contains lots of helpful tips and probably much more info than my guide. All this content is provided completely **for free**, and you should not have to pay to access any of this. If anyone charged you, please ask them for a refund!

Good luck and have fun!
