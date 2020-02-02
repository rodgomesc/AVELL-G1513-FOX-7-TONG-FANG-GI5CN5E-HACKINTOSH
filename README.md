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

## USB Stick Preparation (Windows)

These were mainly transcripted/translated from the original [instruction video](https://www.bilibili.com/video/av81263778) and [instruction page](https://hackintosh.kirainmoe.com/an-zhuang-zhong/macos-an-zhuang-jian-ming-jiao-cheng). The original written guide has some important information on it, so please **take your time to read it, before trying the following steps**, you have been warned.

Boot into your Windows installation (running on the target laptop) and follow these steps:

### System Preparation

- At least 30GB of free disk space (I personally recommend an SSD)
- An 8GB+ USB 2.0 stick (I'm workin with a 32GB one, but 16GB should fit perfectly)
- Backup!

### Required Tools

- [Balena Etcher](https://www.balena.io/etcher/)
- [DiskGenius]()
- [Latest image of macOS Installer](https://blog.daliansky.net/)

