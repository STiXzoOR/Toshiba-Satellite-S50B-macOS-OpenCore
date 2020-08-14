// USB _UPC configuration for Toshiba Sattelite S50-B-N

#ifndef NO_DEFINITIONBLOCK
DefinitionBlock ("", "SSDT", 2, "hack", "_UPC", 0)
{
#endif

    External(_SB.PCI0.XHC.RHUB, DeviceObj)
    Scope(_SB.PCI0.XHC.RHUB)
    {
        External(UPC3, PkgObj) // USB3
        External(UPC2, PkgObj) // USB2
        External(UPCP, PkgObj) // Internal (built-in)
        
        Method(HS01._UPC)
        {
            Return(UPC3)
        }
        
        Method(HS02._UPC)
        {
            Return(UPC3)
        }
        
        Method(HS03._UPC)
        {
            Return(UPC2)
        }
        
        Method(HS05._UPC)
        {
            Return(UPCP)
        }

        Method(HS06._UPC)
        {
            Return(UPCP)
        }

        Method(SSP1._UPC)
        {
            Return(UPC3)
        }
        
        Method(SSP2._UPC)
        {
            Return(UPC3)
        }
    }
    
#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF