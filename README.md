# Hackintosh for Avell G1513 FOX-7 (Hasee TongFang GI5CN5E)

Based on the work of [Rodrigo Gomes](https://github.com/rodgomesc) and [Yume Maruyama](https://github.com/kirainmoe).

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

- An GPT-formatted disk, with a EFI partition of at least 200MB
- At least 30GB of free disk space (I personally recommend an SSD)
- An 8GB+ USB 2.0 stick (I'm workin with a 32GB one, but 16GB should fit perfectly)
- Backup!

### Required Tools

- [Balena Etcher](https://www.balena.io/etcher/)
- [DiskGenius](http://www.diskgenius.cn/)
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
8. Congratulations, you got Clover installed on your drive.
