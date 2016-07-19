
MEMORY  
{
	PAGE 0:
		RESEVE   :   	org = 0x0000   len = 0x0080 
		PROG1    :   	org = 0x0100   len = 0x1200
	    VECT     :   	org = 0x0080   len = 0x0080

	PAGE 1:
		RESEVE1  :   	org = 0x0000   len = 0x1300 
		DARAM2   :   	org = 0x1300   len = 0x0200
        DARAM1   :   	org = 0x1500   len = 0x2b00
}                  
                                                  
SECTIONS
{
        .text    :>     PROG1   PAGE 0
        .cinit   :>     PROG1   PAGE 0
        .switch  :>     PROG1   PAGE 0
        .vectors :>     VECT    PAGE 0
        
        .const   :>     DARAM1  PAGE 1
        .bss     :>     DARAM1  PAGE 1
        
        .stack   :>     DARAM2  PAGE 1
        .system  :>     DARAM2  PAGE 1
        .data    :>     DARAM2  PAGE 1      
}
