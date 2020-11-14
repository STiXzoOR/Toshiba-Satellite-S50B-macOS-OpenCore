// Reference: daliansky/OC-little
// Disable SD Card Reader (RP01) to save power
// Users can change RP08 to whatever father PCI device that they want to disable

DefinitionBlock ("", "SSDT", 2, "hack", "_DRP01", 0x00000000)
{
    External (_SB_.PCI0.RP01, DeviceObj)

    If (_OSI ("Darwin"))
    {
        Scope (_SB.PCI0.RP01)
        {
            OperationRegion (DE01, PCI_Config, 0x50, One)
            Field (DE01, AnyAcc, NoLock, Preserve)
            {
                    ,   4, 
                DDDD,   1
            }

            DDDD = One
        }
    }
}