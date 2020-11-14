// Reference: RehabMan/OS-X-Clover-Laptop-Config@master/hotpatch/SSDT-GPRW.dsl by Rehabman
// For solving instant wake by hooking GPRW

DefinitionBlock ("", "SSDT", 2, "STiX", "GPRW", 0)
{
    External (XPRW, MethodObj)

    Method (GPRW, 2, Serialized)
    {
        If (_OSI ("Darwin"))
        {
            For (,,)
            {
                If (0x6d == Arg0) { Return (Package() { 0x6d, 0, }) }
                If (0x0d == Arg0) { Return (Package() { 0x0d, 0, }) }
                If (0x09 == Arg0) { Return (Package() { 0x09, 0, }) }
                Break
            }
        }
        
        Return (XPRW (Arg0, Arg1))
    }
}
//EOF
