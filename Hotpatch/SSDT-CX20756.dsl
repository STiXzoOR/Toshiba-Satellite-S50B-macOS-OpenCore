// CodecCommander.kext configuration to fix external mic issues

DefinitionBlock ("", "SSDT", 2, "STiX", "CX20756", 0)
{
    Name(_SB.PCI0.HDEF.RMCF, Package()
    {
        "CodecCommander", Package()
        {
            "Custom Commands", Package()
            {
                Package(){},
                Package()
                {
                    "Command", Buffer() { 0x01, 0x97, 0x07, 0x24 },
                    "On Init", ">y",
                    "On Sleep", ">n",
                    "On Wake", ">y",
                },
                
                Package ()
                {
                    "Command", Buffer (0x04) { 0x01, 0xA7, 0x07, 0x20 }, 
                    "On Init", ">y", 
                    "On Sleep", ">n", 
                    "On Wake", ">y",
                },

            },
            "Perform Reset", ">n", 
            "Perform Reset on External Wake", ">n", 
        },
    })
}
//EOF