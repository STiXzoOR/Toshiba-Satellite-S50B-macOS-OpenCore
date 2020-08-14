// Keyboard configuration
// Only necessary if using ApplePS2SmartTouchpad

DefinitionBlock("", "SSDT", 2, "hack", "PS2K", 0)
{
    External(_SB.PCI0.LPCB.PS2K, DeviceObj)
    External(_SB.PCI0.LPCB.EC, DeviceObj)

    Scope(_SB.PCI0.LPCB.EC)
    {
        Method (_Q63)
        {
            // Brightness Down
            Notify (\_SB.PCI0.LPCB.PS2K, 0x0405) // For VoodooPS2Controller.kext (by RehabMan)
            Notify (\_SB.PCI0.LPCB.PS2K, 0x20) // For ApplePS2SmartTouchPad.kext (by EMlyDinEsH)
        }

        Method (_Q62)
        {
            // Brightness Up
            Notify (\_SB.PCI0.LPCB.PS2K, 0x0406) // For VoodooPS2Controller.kext (by RehabMan)
            Notify (\_SB.PCI0.LPCB.PS2K, 0x10) // For ApplePS2SmartTouchPad.kext (by EMlyDinEsH)
        }
    }
}
//EOF