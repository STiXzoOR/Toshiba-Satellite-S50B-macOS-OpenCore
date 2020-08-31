// Keyboard configuration

DefinitionBlock ("", "SSDT", 2, "STiX", "PS2K", 0)
{
    External (_SB_.PCI0.LPCB.EC0_, DeviceObj)
    External (_SB_.PCI0.LPCB.EC0_.XQ62, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC0_.XQ63, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)

    Scope (_SB.PCI0.LPCB.EC0)
    {
        // Brightness Down
        Method (_Q63, 0, NotSerialized)  // _Q63: EC Query
        {
            If (_OSI ("Darwin"))
            {
                Notify (PS2K, 0x0405)  // (F14) VoodooPS2
                Notify (PS2K, 0x20) // (F14) ApplePS2SmartTouchad
            }
            Else
            {
                \_SB.PCI0.LPCB.EC0.XQ63 ()
            }
        }

        // Brightness Up
        Method (_Q62, 0, NotSerialized)  // _Q62: EC Query
        {
            If (_OSI ("Darwin"))
            {
                Notify (PS2K, 0x0406)  // (F15) VoodooPS2
                Notify (PS2K, 0x10) // (F15) ApplePS2SmartTouchPad
            }
            Else
            {
                \_SB.PCI0.LPCB.EC0.XQ62 ()
            }
        }
    }
}