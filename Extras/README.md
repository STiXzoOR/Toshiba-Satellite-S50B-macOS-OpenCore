# Extra/Deprecated Files

## CX20756 Folder

Contains the files for patching the AppleHDA.kext to get the audio fully working.

## CPUFriendDataProvider.kext

Alternative way to adjust CPU frequency vectors. Use in conjuction with the SSDT-PLUG by replacing the existing one.

## AppleSDXCInjector.kext (Experimental)

Enable SD card support by patching the `com.apple.driver.AppleSDXC`. Apply the below patch in `config.plist`:

**Kernel -> Patch**:

| Key        | Type    | Value                                                      |
| :--------- | :------ | :--------------------------------------------------------- |
| Comment    | String  | Realtek Inc. SD Card Reader - pci14e4,16bc -> pci10ec,5229 |
| Enabled    | Boolean | True                                                       |
| Find       | Data    | 706369313465342C31366263                                   |
| Replace    | Data    | 706369313065632C35323239                                   |
| Identifier | String  | com.apple.driver.AppleSDXC                                 |
| Limit      | Number  | 0                                                          |
| Count      | Number  | 0                                                          |
| Skip       | Number  | 0                                                          |
| Arch       | String  | Any                                                        |

## SSDT-UPC

Alternative way to map USB ports. Remove USBMap.kext prior using this method. Also apply the following patches in `config.plist`:

**ACPI -> Add**:

| Key     | Type    | Value        |
| :------ | :------ | :----------- |
| Comment | String  | SSDT-UPC.aml |
| Path    | String  | SSDT-UPC.aml |
| Enabled | Boolean | True         |

**ACPI -> Patch**:

| Key            | Type    | Value                          |
| :------------- | :------ | :----------------------------- |
| Comment        | String  | Change Method(UPC,0,S) to XUPC |
| Enabled        | Boolean | True                           |
| Find           | Data    | 5F55504308                     |
| Replace        | Data    | 5855504308                     |
| Limit          | Number  | 0                              |
| Count          | Number  | 0                              |
| Skip           | Number  | 0                              |
| Mask           | Data    |                                |
| ReplaceMask    | Data    |                                |
| OemTableId     | Data    |                                |
| TableLength    | Number  |                                |
| TableSignature | Data    |                                |
