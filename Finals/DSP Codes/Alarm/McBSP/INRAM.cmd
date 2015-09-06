MEMORY  {
	PAGE 0:
		RESEVE:   org=0x0000    len = 0x80 
 	PAGE 0:
		PROG1:    org = 0x0100    len = 0x1200
	PAGE 0:
	    VECT:     org = 0x0080,  len = 0x80


	PAGE 1:
		RESEVE1:   org   00h   len = 0x1300 			
	PAGE 1:
		DARAM2:   org = 0x1300   len = 0x400
	PAGE 1:
        DARAM1:   org = 0x1700   len = 0x2b00
}                  
                                                  
SECTIONS{
        .text :  >       PROG1   PAGE 0
        .cinit : >       PROG1   PAGE 0
        .switch: >       PROG1   PAGE 0
        .vectors:>       VECT    PAGE 0
        
        
        
        
         coef : align (64) { } > DARAM2 PAGE 1
  		 x_new : align (64) { } > DARAM2 PAGE 1
  		 x_old : align (64) { } > DARAM2 PAGE 1
		 .const:  >       DARAM1   PAGE 1
        .bss  :  >       DARAM1   PAGE 1
  		 .stack : >       DARAM2   PAGE 1
        .system: >       DARAM2   PAGE 1
        .data :  >       DARAM2   PAGE 1      
        }
