;************************************************
;* Led_control.asm *
;************************************************
        .title   "Led_control.asm"
	    .mmregs
STACK .usect	"STACK",10h
        .def     _c_int00
        .def     TINT0   
        .mmregs                                 
        .text                     ;code follows ...
_c_int00:	STM #STACK+10h,SP    ;set stack pointer
			STM #0010h,TCR
			STM #65535,PRD
			STM #0C2Fh,TCR
			STM #0008h,IFR
			STM #0008h,IMR
			STM #00E0h,PMST
			RSBX	INTM
			
end:    B        end

TINT0:		XORM #2000h,ST1
	    	RETE
	.end
