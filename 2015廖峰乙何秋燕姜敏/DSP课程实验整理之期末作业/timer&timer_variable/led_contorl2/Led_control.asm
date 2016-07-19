;************************************************
;* Led_control.asm *
;************************************************
        .title   "Led_control.asm"
	    .mmregs
STACK   .usect	"STACK",10h
        .def     _c_int00
        .def     TINT0 
        .def     TINT1 
        .def     PRD1
        .def     TCR1
PRD1    .set     0031h
TCR1    .set     0032h
                                         
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

TINT0:	NOP
		NOP
		NOP
		RSBX XF
		STM  #0000h,IMR
		STM  #0010h,TCR
		STM  #0010h,TCR1
		STM  #1FFFh,PRD1
		STM  #0C2Fh,TCR1
	    STM  #0080h,IFR
		STM  #0080h,IMR
	    RETE

TINT1: NOP
	    NOP
        NOP
	    SSBX	XF
	    STM  #0000h,IMR
	    STM  #0010h,TCR1
	    STM  #0010h,TCR
	    STM  #0FFFFh,PRD
	    STM  #0C2Fh,TCR
	    STM  #0008h,IFR
	    STM  #0008h,IMR
	    RETE

	.end