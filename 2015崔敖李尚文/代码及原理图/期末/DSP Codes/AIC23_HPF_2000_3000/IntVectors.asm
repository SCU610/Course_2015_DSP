;FileName:			IntVectors.asm

				.title			"IntVectors.asm"
				.mmregs
				.ref			_c_int00
				.ref			_c_int01_NMI
				.ref			_c_int02_SINT17
				.ref			_c_int03_SINT18
				.ref			_c_int04_SINT19
				.ref			_c_int05_SINT20
				.ref			_c_int06_SINT21
				.ref			_c_int07_SINT22
				.ref			_c_int08_SINT23
				.ref			_c_int09_SINT24
				.ref			_c_int10_SINT25
				.ref			_c_int11_SINT26
				.ref			_c_int12_SINT27
				.ref			_c_int13_SINT28
				.ref			_c_int14_SINT29
				.ref			_c_int15_SINT30
				.ref			_c_int16_INT0
				.ref			_c_int17_INT1
				.ref			_c_int18_INT2
				.ref			_c_int19_TINT0
				.ref			_c_int20_BRINT0
				.ref			_c_int21_BXINT0
				.ref			_c_int22_DMAC0
				.ref			_c_int23_TINT1
				.ref			_c_int24_INT3
				.ref			_c_int25_HPINT
				.ref			_c_int26_BRINT1
				.ref			_c_int27_BXINT1
				.ref			_c_int28_DMAC4
				.ref			_c_int29_DMAC5

				.sect			.intvectors

RESET:			B				_c_int00
				NOP
				NOP

NMI:			B				_c_int01_NMI
				NOP
				NOP

SINT17:			B				_c_int02_SINT17
				NOP
				NOP

SINT18:			B				_c_int03_SINT18
				NOP
				NOP

SINT19:			B				_c_int04_SINT19
				NOP
				NOP

SINT20:			B				_c_int05_SINT20
				NOP
				NOP

SINT21:			B				_c_int06_SINT21
				NOP
				NOP

SINT22:			B				_c_int07_SINT22
				NOP
				NOP

SINT23:			B				_c_int08_SINT23
				NOP
				NOP

SINT24:			B				_c_int09_SINT24
				NOP
				NOP

SINT25:			B				_c_int10_SINT25
				NOP
				NOP

SINT26:			B				_c_int11_SINT26
				NOP
				NOP

SINT27:			B				_c_int12_SINT27
				NOP
				NOP

SINT28:			B				_c_int13_SINT28
				NOP
				NOP

SINT29:			B				_c_int14_SINT29
				NOP
				NOP

SINT30:			B				_c_int15_SINT30
				NOP
				NOP

INT0_SINT0:		B				_c_int16_INT0
				NOP
				NOP

INT1_SINT1:		B				_c_int17_INT1
				NOP
				NOP

INT2_SINT2:		B				_c_int18_INT2
				NOP
				NOP

TINT0_SINT3:	B				_c_int19_TINT0
				NOP
				NOP

BRINT0_SINT4:	B				_c_int20_BRINT0
				NOP
				NOP

BXINT0_SINT5:	B				_c_int21_BXINT0
				NOP
				NOP

DMAC0_SINT6:	B				_c_int22_DMAC0
				NOP
				NOP

TINT1_SINT7:	B				_c_int23_TINT1
				NOP
				NOP

INT3_SINT8:		B				_c_int24_INT3
				NOP
				NOP

HPINT_SINT9:	B				_c_int25_HPINT
				NOP
				NOP

BRINT1_SINT10:	B				_c_int26_BRINT1
				NOP
				NOP

BXINT1_SINT11:	B				_c_int27_BXINT1
				NOP
				NOP

DMAC4_SINT12:	B				_c_int28_DMAC4
				NOP
				NOP

DMAC5_SINT13:	B				_c_int29_DMAC5
				NOP
				NOP

				.end