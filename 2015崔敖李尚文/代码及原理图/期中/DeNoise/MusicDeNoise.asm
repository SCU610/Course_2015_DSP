						.title			"MusicDeNoise.asm"

						.mmregs

						.def			_c_int00
						.def			CurrentInput
						.def			CurrentOutput

IO_Read					.set			0010h
IO_Write				.set			0020h
FIR_Length				.set			120
MusicLength				.set			26
SampleRate				.set			16000

LPFCOEFF				.word			0x0009,0x0008,0x0007,0x0005,0x0004
						.word			0x0002,0x0000,0xfffd,0xfffa,0xfff7
						.word			0xfff2,0xffee,0xffe8,0xffe2,0xffdb
						.word			0xffd4,0xffcc,0xffc4,0xffbc,0xffb4
						.word			0xffad,0xffa6,0xffa1,0xff9c,0xff9a
						.word			0xff99,0xff9b,0xff9f,0xffa7,0xffb2
						.word			0xffc0,0xffd3,0xffe9,0x0004,0x0023
						.word			0x0047,0x006f,0x009b,0x00cb,0x00fe
						.word			0x0135,0x016f,0x01ac,0x01ea,0x022a
						.word			0x026b,0x02ab,0x02eb,0x032a,0x0367
						.word			0x03a1,0x03d7,0x0409,0x0437,0x045f
						.word			0x0481,0x049d,0x04b2,0x04c0,0x04c8
						.word			0x04c8,0x04c0,0x04b2,0x049d,0x0481
						.word			0x045f,0x0437,0x0409,0x03d7,0x03a1
						.word			0x0367,0x032a,0x02eb,0x02ab,0x026b
						.word			0x022a,0x01ea,0x01ac,0x016f,0x0135
						.word			0x00fe,0x00cb,0x009b,0x006f,0x0047
						.word			0x0023,0x0004,0xffe9,0xffd3,0xffc0
						.word			0xffb2,0xffa7,0xff9f,0xff9b,0xff99
						.word			0xff9a,0xff9c,0xffa1,0xffa6,0xffad
						.word			0xffb4,0xffbc,0xffc4,0xffcc,0xffd4
						.word			0xffdb,0xffe2,0xffe8,0xffee,0xfff2
						.word			0xfff7,0xfffa,0xfffd,0x0000,0x0002
						.word			0x0004,0x0005,0x0007,0x0008,0x0009

						.data

						.bss			CurrentInput,1
						.bss			CurrentOutput,1

Buffer_Old				.usect			"Buffer_Old",FIR_Length/2
Buffer_New				.usect			"Buffer_New",FIR_Length/2

						.text

LPF:					MVKD			*(CurrentInput),*AR2
						RPTZ			B,#(FIR_Length/2-1)
						FIRS			*AR2+0%,*AR3+0%,LPFCOEFF
						STH				B,*(CurrentOutput)
						MAR				*+AR2(1)%
						MVDD			*AR2,*AR3+0%
						RET

_c_int00:				SSBX			INTM
						STM				#0000h,IFR
						STM				#0000h,IMR
						ST				#0,*(CurrentInput)
						ST				#0,*(CurrentOutput)
						STM				#Buffer_Old,AR0
						RPT				#(FIR_Length/2-1)
						ST				#0,*AR0+
						STM				#Buffer_New,AR0
						RPT				#(FIR_Length/2-1)
						ST				#0,*AR0+


						SSBX			FRCT
						STM				#Buffer_New,AR2
						STM				#(Buffer_Old+FIR_Length/2-1),AR3
						STM				#(FIR_Length/2),BK
						STM				#-1,AR0

						STM				#MusicLength-1,AR5						

SecondCount:			STM				#(SampleRate-1),AR4
SampleCount:			INTR			#19
						CALL			LPF
						BANZ			SampleCount,*AR4-
						BANZ			SecondCount,*AR5-
LOOP:					B				LOOP

						.end