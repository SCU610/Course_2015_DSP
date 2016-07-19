****************
DRR11A	.set 0x41
DXR11A	.set 0x43

		.ref  _c_int00
		.ref  TINT0
    	.ref  TINT1	
		.sect ".vectors"
		
rs: BD _c_int00
	nop
	nop
	
nmi: rete 				;NMI, SINT16
    nop
	nop
	nop
sint17: BD _c_int00 	;SINT17
	nop
	nop
	
sint18: BD _c_int00 	;SINT18
	NOP
	NOP
	
sint19: BD _c_int00 	;SINT19
	NOP
	NOP
	
sint20: BD _c_int00 	;SINT20
	NOP
	NOP
sint21: BD _c_int00 	;SINT21
	NOP
	NOP
	
sint22: BD _c_int00 	;SINT22
	NOP
	NOP
sint23: BD sint23 		;SINT23
	NOP
	NOP
	
sint24: BD sint24 		;SINT24
	NOP
	NOP
	
sint25: BD sint25 		;SINT25
	NOP
	NOP
	
sint26: BD sint26 		;SINT26
	NOP
	NOP
sint27: BD sint27 		;SINT27
	NOP
	NOP
sint28: BD sint28 		;SINT28
	NOP
	NOP
sint29: BD sint29 		;SINT29
	NOP
	NOP
sint30: BD sint30 		;SINT30
	NOP
	NOP
int0: BD int0 			;INT0, SINT0
	NOP
	NOP
int1: BD int1 			;INT1, SINT1
	NOP
	NOP
int2: BD int2 			;INT2, SINT2
	NOP
	NOP
tint0: BD TINT0 		;TINT0, SINT3
	NOP
	NOP
brint0: BD _c_int00 	;BRINT0, SINT4
	NOP
	NOP
bxint0: BD bxint0 		;BXINT0, SINT5
	NOP
	NOP
dmac0: BD dmac0 		;DMAC0, brint2, SINT6
	NOP
	NOP
tint1: BD TINT1 		;DMAC1, bxint2, SINT7 ??
	NOP
	NOP
int3: BD int3 			;INT3, SINT8
	NOP
	NOP
hpint: BD _c_int00 		;HPINT, SINT9
	NOP
	NOP
brint1: BD brint1 		;BRINT1 or DMAC2, SINT10
	NOP
	NOP
;bxint1: BD mcbsp1 		;BXINT1 or DMAC3, SINT11
bxint1: BD _c_int00 	;BXINT1 or DMAC3, SINT11
	NOP
	NOP
dmac4: BD dmac4 		;DMAC4, SINT12
	NOP
	NOP
dmac5: BD dmac5 		;DMAC5, SINT13
	NOP
	NOP
rsvd1: BD rsvd1 		;reserved
	NOP
	NOP
rsvd2: BD rsvd2 		;reserved
	NOP
	NOP


	.end
     


