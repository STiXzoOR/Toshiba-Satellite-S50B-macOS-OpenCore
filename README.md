# Toshiba Sattelite S50B-N-15 macOS - OpenCore

This repository contains scripts and ACPI patches for Toshiba Sattelite S50B-N-15 (maybe and some others in the same series) to get macOS installed and running.

## Supported Models

Toshiba Sattelite S50B-N-15

## Hardware

| Type          | Name                                            |
| ------------- | ----------------------------------------------- |
| CPU           | Intel i5-5200U 2.20GHz/3MB                      |
| RAM           | Samsung DDR3 1600MHz 16GB (2 x 8GB)             |
| GPU           | Intel HD Graphics 5500 / ATI R7 M265 (Disabled) |
| SSD           | Samsung 860 EVO 500GB                           |
| Sound card    | Conexant CX20756                                |
| Wireless card | DW1560                                          |

## Prequests

> **BIOS/UEFI settings**

Change the following settings before you boot into the macOS installer:

- Exit → System Defaults [F9]: Yes
- Security → Secure Boot: Disabled
- Power Managements → Wake Up LAN: Disabled
- Power Managements → Wake On Keyboard: Disabled
- Power Managements → Critical Battery Wake Up: Enabled
- Power Managements → Panel Open Power On: Disabled
- Power Managements → Power On By AC: Disabled
- Power Managements → Dynamic CPU Frequency Mode: Dynamic Switch
- Power Managements → Intel Turbo Boost: Enabled
- Power Managements → SATA Interface Technology: Performance
- Advanced → USB Power in Sleep Mode: Disabled
- Advanced \ System Configuration → Boot Mode: UEFI Boot

> **Patching BIOS**

Since macOS Yosemite, Apple raised the minimum stolen memory in the AppleIntelBDWGraphicsFramebuffer binary. Kernel panic will happen if the DVMT pre-allocated memory in BIOS settings is lower than 66MB and the default value of DVMT pre-allocated memory in most laptops BIOS is 32MB. However on laptops, the DVMT pre-allocated value can't be changed through BIOS so you have to patch it by following the steps below.

1. Prepare USB with EFI Shell

   - Download [EFI shell](http://www.firewolf.science/wp-content/uploads/2015/04/EFI-shell.zip).
   - Format it in **FAT32** filesystem.
   - Copy **BOOT** folder to your USB stick.

2. Dump current BIOS file

   - Download [Universal BIOS Backup Toolkit](http://m.majorgeeks.com/files/details/universal_bios_backup_toolkit.html) (Windows version only).
   - Run it as an **ADMIN**.
   - Press **READ**.
   - Wait until it has finished.
   - Press **BACKUP** and save it as **BIOS.rom**.

3. Extract SETUP Binary file

   - Download [UEFITools](https://github.com/LongSoft/UEFITool/releases).
   - Open the **BIOS** file that you saved previously.
   - Find the module labeled with **SetupUtility** and extract the **PE32 image** section﻿ in this module as a binary file.

4. Convert SETUP Binary file to plain text

   - Download [Universal IFR Extractor](https://github.com/LongSoft/Universal-IFR-Extractor/releases) (Windows version only).
   - Open the Universal IFR Extractor and load the binary file you just extracted from UEFITools.
   - Click **EXTRACT** to save the **BIOS** settings in plain text format.

5. Find DVMT variable and value

   - Open the extracted **SetupIFR.txt** and find the keyword **"DVMT"**.
   - Mark down the DVMT variable and 96MB value. Example: variable=0x18C and value=0x3.

6. Boot into EFI Shell

   - Reboot system.
   - Plug USB.
   - Boot into EFI Shell.

7. Change DVMT value

   - Type in EFI Shell: setup_var variable value. Replace **variable** and **value** with the DVMT variable and value you found above.
   - Reboot system.

## Install

To start, the developer tools must be installed, if you don't have them already. Run Terminal, and type:

```(shell)
git
```

You will be prompted to install the developer tools. Since you have internet working, you can choose to have it download and install them automatically. Do that before continuing.
After the developer tools are installed, we need to make a copy of the project on github.

In Terminal:

```(shell)
mkdir ~/Projects
cd ~/Projects
git clone https://github.com/STiXzoOR/Toshiba-Satellite-S50B-macOS s50b.git
cd s50b.git
```

To download the kexts & tools, in Terminal:

```(shell)
./wizard.sh --download-requirements
```

To install everything, in Terminal:

```(shell)
./wizard.sh --install-downloads
```

To install the pre-configured config.plst to EFI, in Terminal:

```(shell)
./wizard.sh --install-config
```

To finish the setup, we need a correctly patched ACPI, in Terminal:

```(shell)
cd ~/Projects/s50b.git
make
make install
```

## Credits

- [Apple](https://apple.com) for [macOS](https://www.apple.com/macos/)
- [Acidanthera](https://github.com/acidanthera) for [OpenCore](https://github.com/acidanthera/OpenCorePkg), [Lilu](https://github.com/acidanthera/Lilu), [AppleALC](https://github.com/acidanthera/AppleALC), [WhateverGreen](https://github.com/acidanthera/WhateverGreen), [VirtualSMC](https://github.com/acidanthera/VirtualSMC), [AirportBrcmFixup](https://github.com/acidanthera/AirportBrcmFixup), [BT4LEContinuityFixup](https://github.com/acidanthera/BT4LEContinuityFixup), [BrcmPatchRAM](https://github.com/acidanthera/BrcmPatchRAM), [MaciASL](https://github.com/acidanthera/MaciASL) and [IOJones](https://github.com/acidanthera/IOJones)
- [Dortania](https://github.com/dortania) for the [OpenCore install guide](https://dortania.github.io/OpenCore-Install-Guide), [Pre-built kexts](https://dortania.github.io/builds)
- [Mieze](https://github.com/Mieze) for [RealtekRTL8111](https://github.com/Mieze/RTL8111_driver_for_OS_X)
- [The BraveKnight](https://github.com/the-braveknight) for the his [tools](https://github.com/the-braveknight/macos-tools)
- [EMlyDinEsH](https://osxlatitude.com/profile/7370-emlydinesh/) for [Apple PS/2 Smart TouchPad](https://osxlatitude.com/forums/topic/1948-elan-focaltech-and-synaptics-smart-touchpad-driver-mac-os-x/)
- [Sinetek](https://www.insanelymac.com/forum/profile/4920-sinetek/) for [SD Card Support](https://www.insanelymac.com/forum/topic/321080-sineteks-driver-for-realtek-rtsx-sdhc-card-readers/)
- [CodeRobe](https://github.com/coderobe/) for the [License](https://github.com/coderobe/AzulPatcher4600/blob/master/LICENSE.txt)

## LICENSE

- This project is licensed under the Anyone But TonyMac License - see the [LICENSE](https://github.com/STiXzoOR/Toshiba-Sattelite-S50B-N-15-macOS/blob/master/LICENSE) file for details.
