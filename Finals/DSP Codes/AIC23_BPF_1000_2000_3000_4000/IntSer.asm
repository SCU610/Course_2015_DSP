;FileNeme: IntSer.asm

					.title		"IntSer.asm"
					.mmregs
					
					.def		_c_int01_NMI
					.def		_c_int02_SINT17
					.def		_c_int03_SINT18
					.def		_c_int04_SINT19
					.def		_c_int05_SINT20
					.def		_c_int06_SINT21
					.def		_c_int07_SINT22
					.def		_c_int08_SINT23
					.def		_c_int09_SINT24
					.def		_c_int10_SINT25
					.def		_c_int11_SINT26
					.def		_c_int12_SINT27
					.def		_c_int13_SINT28
					.def		_c_int14_SINT29
					.def		_c_int15_SINT30
					.def		_c_int16_INT0
					.def		_c_int17_INT1
					.def		_c_int18_INT2
					.def		_c_int19_TINT0
					.def		_c_int20_BRINT0
					.def		_c_int21_BXINT0
					.def		_c_int22_DMAC0
					.def		_c_int23_TINT1
					.def		_c_int24_INT3
					.def		_c_int25_HPINT
					.def		_c_int26_BRINT1
					.def		_c_int27_BXINT1
					.def		_c_int28_DMAC4
					.def		_c_int29_DMAC5

					.ref		Addr_SPSA0
					.ref		Addr_SPSD0
					.ref		Addr_SPCR1
					.ref		Addr_SPCR2
					.ref		Addr_RCR1
					.ref		Addr_RCR2
					.ref		Addr_XCR1
					.ref		Addr_XCR2
					.ref		Addr_PCR
					.ref		Addr_DRR10
					.ref		Addr_DXR10

					.ref		Value_SPCR10
					.ref		Value_SPCR20
					.ref		Value_RCR10
					.ref		Value_RCR20
					.ref		Value_XCR10
					.ref		Value_XCR20
					.ref		Value_PCR0

					.ref		CurrentInput
					.ref		CurrentOutput


					.text

_c_int01_NMI:		NOP
					RETE

_c_int02_SINT17:	NOP
					RETE

_c_int03_SINT18:	NOP
					RETE

_c_int04_SINT19:	NOP
					RETE

_c_int05_SINT20:	NOP
					RETE

_c_int06_SINT21:	NOP
					RETE					

_c_int07_SINT22:	NOP
					RETE

_c_int08_SINT23:	NOP
					RETE

_c_int09_SINT24:	NOP
					RETE

_c_int10_SINT25:	NOP
					RETE

_c_int11_SINT26:	NOP
					RETE

_c_int12_SINT27:	NOP
					RETE

_c_int13_SINT28:	NOP
					RETE

_c_int14_SINT29:	NOP
					RETE

_c_int15_SINT30:	NOP
					RETE

_c_int16_INT0:		NOP
					RETE

_c_int17_INT1:		NOP
					RETE

_c_int18_INT2:		NOP
					RETE					

_c_int19_TINT0:		NOP
					NOP
					RETE

_c_int20_BRINT0:	
					MVMD		Addr_DRR10,*(CurrentInput)
					MVDM		*(CurrentOutput),Addr_DXR10
					STM			#0,AR5
					RETE

_c_int21_BXINT0:	NOP
					RETE

_c_int22_DMAC0:		NOP
					RETE

_c_int23_TINT1:		NOP
					RETE

_c_int24_INT3:		NOP
					RETE

_c_int25_HPINT:		NOP
					RETE

_c_int26_BRINT1:	NOP
					RETE

_c_int27_BXINT1:	NOP
					RETE

_c_int28_DMAC4:		NOP
					RETE

_c_int29_DMAC5:		NOP
					RETE

					.end