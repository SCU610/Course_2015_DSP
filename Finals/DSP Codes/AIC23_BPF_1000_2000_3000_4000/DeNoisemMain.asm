						.title			"DeNoisemMain.asm"

						.mmregs

						.def			_c_int00

						.def			Addr_SPSA0
						.def			Addr_SPSD0
						.def			Addr_SPCR1
						.def			Addr_SPCR2
						.def			Addr_RCR1
						.def			Addr_RCR2
						.def			Addr_XCR1
						.def			Addr_XCR2
						.def			Addr_PCR
						.def			Addr_DRR10
						.def			Addr_DXR10

						.def			Value_SPCR10
						.def			Value_SPCR20
						.def			Value_RCR10
						.def			Value_RCR20
						.def			Value_XCR10
						.def			Value_XCR20
						.def			Value_PCR0

						.def			CurrentInput
						.def			CurrentOutput

FIR_Length				.set			250
MusicLength				.set			26
SampleRate				.set			16000

Addr_SPSA0				.set			38h				;Address of McBSP0 sub-bank address reg.
Addr_SPSD0				.set			39h				;Address of McBSP0 sub-bank data reg.
Addr_SPCR1				.set			00h				;Address of SP control reg 1.
Addr_SPCR2				.set			01h				;Address of SP control reg 2.
Addr_RCR1				.set			02h				;Address of receive control reg. 1
Addr_RCR2				.set			03h				;Address of receive control reg. 2
Addr_XCR1				.set			04h				;Address of transmit control reg. 1
Addr_XCR2				.set			05h				;Address of transmit control reg. 2
Addr_PCR				.set			0eh				;Address of pin control reg.
Addr_DRR10				.set			21h				;Address of McBSP0 data receive reg. 1
Addr_DXR10				.set			23h				;Address of McBSP0 transmit reg. 1

Value_SPCR10			.set			00h
Value_SPCR20			.set			0200h
Value_RCR10				.set			0140h
Value_RCR20				.set			04h
Value_XCR10				.set			0140h
Value_XCR20				.set			04h
Value_PCR0				.set			01h

BPFCOEFF				.word			0xffff,0xffff,0xffff,0xffff,0xffff
						.word			0xffff,0x0000,0x0000,0x0001,0x0001
						.word			0x0001,0x0001,0x0000,0x0000,0x0000
						.word			0xffff,0x0000,0x0001,0x0002,0x0003
						.word			0x0004,0x0004,0x0002,0x0000,0xfffd
						.word			0xfff9,0xfff6,0xfff4,0xfff3,0xfff4
						.word			0xfff7,0xfffb,0xffff,0x0003,0x0005
						.word			0x0004,0x0002,0xfffe,0xfffb,0xfff9
						.word			0xfffb,0x0001,0x000a,0x0015,0x0020
						.word			0x0029,0x002c,0x0028,0x001c,0x000b
						.word			0xfff8,0xffe5,0xffd7,0xffd0,0xffd2
						.word			0xffdb,0xffe9,0xfff6,0xfffe,0xfffe
						.word			0xfff4,0xffe2,0xffcb,0xffb7,0xffad
						.word			0xffb3,0xffcb,0xfff4,0x0029,0x0061
						.word			0x0090,0x00ad,0x00b1,0x009b,0x0070
						.word			0x0038,0x0001,0xffd8,0xffc5,0xffcd
						.word			0xffeb,0x0013,0x0036,0x0043,0x002f
						.word			0xfff4,0xff98,0xff29,0xfec0,0xfe75
						.word			0xfe5d,0xfe87,0xfef0,0xff8b,0x003d
						.word			0x00e4,0x0161,0x019a,0x018a,0x013a
						.word			0x00c5,0x0052,0x0009,0x000b,0x0064
						.word			0x0109,0x01d6,0x0292,0x02fe,0x02df
						.word			0x020f,0x008a,0xfe72,0xfc11,0xf9cb
						.word			0xf80d,0xf73c,0xf79b,0xf941,0xfc0c
						.word			0xffa3,0x0388,0x0726,0x09ef,0x0b72
						.word			0x0b72,0x09ef,0x0726,0x0388,0xffa3
						.word			0xfc0c,0xf941,0xf79b,0xf73c,0xf80d
						.word			0xf9cb,0xfc11,0xfe72,0x008a,0x020f
						.word			0x02df,0x02fe,0x0292,0x01d6,0x0109
						.word			0x0064,0x000b,0x0009,0x0052,0x00c5
						.word			0x013a,0x018a,0x019a,0x0161,0x00e4
						.word			0x003d,0xff8b,0xfef0,0xfe87,0xfe5d
						.word			0xfe75,0xfec0,0xff29,0xff98,0xfff4
						.word			0x002f,0x0043,0x0036,0x0013,0xffeb
						.word			0xffcd,0xffc5,0xffd8,0x0001,0x0038
						.word			0x0070,0x009b,0x00b1,0x00ad,0x0090
						.word			0x0061,0x0029,0xfff4,0xffcb,0xffb3
						.word			0xffad,0xffb7,0xffcb,0xffe2,0xfff4
						.word			0xfffe,0xfffe,0xfff6,0xffe9,0xffdb
						.word			0xffd2,0xffd0,0xffd7,0xffe5,0xfff8
						.word			0x000b,0x001c,0x0028,0x002c,0x0029
						.word			0x0020,0x0015,0x000a,0x0001,0xfffb
						.word			0xfff9,0xfffb,0xfffe,0x0002,0x0004
						.word			0x0005,0x0003,0xffff,0xfffb,0xfff7
						.word			0xfff4,0xfff3,0xfff4,0xfff6,0xfff9
						.word			0xfffd,0x0000,0x0002,0x0004,0x0004
						.word			0x0003,0x0002,0x0001,0x0000,0xffff
						.word			0x0000,0x0000,0x0000,0x0001,0x0001
						.word			0x0001,0x0001,0x0000,0x0000,0xffff
						.word			0xffff,0xffff,0xffff,0xffff,0xffff



						.data

						.bss			CurrentInput,1
						.bss			CurrentOutput,1


STACK					.usect			"STACK",10h

Buffer_Old				.usect			"Buffer_Old",FIR_Length/2
Buffer_New				.usect			"Buffer_New",FIR_Length/2

						.text

LPF:					MVKD			*(CurrentInput),*AR2
						RPTZ			B,#(FIR_Length/2-1)
						FIRS			*AR2+0%,*AR3+0%,BPFCOEFF
						STH				B,*(CurrentOutput)
						MAR				*+AR2(1)%
						MVDD			*AR2,*AR3+0%

						STM				#1,AR5

						RET

System_Init:			STM				#0000h,CLKMD
						RPT				#100h
						NOP
						STM				#40c7h,CLKMD

						STM				#0FFFFh,IFR
						STM				#0000h,IMR
						ST				#0,*(CurrentInput)
						ST				#0,*(CurrentOutput)
						STM				#Buffer_Old,AR0
						RPT				#(FIR_Length/2-1)
						ST				#0,*AR0+
						STM				#Buffer_New,AR0
						RPT				#(FIR_Length/2-1)
						ST				#0,*AR0+

						STM				#1,AR5

						RET

McBSP_Init:				STM				Addr_SPCR1,Addr_SPSA0
						STM				#0,Addr_SPSD0

						STM				Addr_SPCR2,Addr_SPSA0
						STM				#0,Addr_SPSD0

						STM				Addr_SPCR1,Addr_SPSA0
						STM				#Value_SPCR10,Addr_SPSD0

						STM				Addr_SPCR2,Addr_SPSA0
						STM				#Value_SPCR20,Addr_SPSD0

						STM				Addr_PCR,Addr_SPSA0
						STM				#Value_PCR0,Addr_SPSD0

						STM				Addr_RCR1,Addr_SPSA0
						STM				#Value_RCR10,Addr_SPSD0

						STM				Addr_RCR2,Addr_SPSA0
						STM				#Value_RCR20,Addr_SPSD0

						STM				Addr_XCR1,Addr_SPSA0
						STM				#Value_XCR10,Addr_SPSD0

						STM				Addr_XCR2,Addr_SPSA0
						STM				#Value_XCR20,Addr_SPSD0

						RPT				#10h
						NOP

						STM				Addr_SPCR1,Addr_SPSA0
						STM				#0001h,Addr_SPSD0

						STM				Addr_SPCR2,Addr_SPSA0
						STM				#0201h,Addr_SPSD0

						RPT				#10h
						NOP

						STM				#0010h,IMR
						
						RET



_c_int00:				STM				#STACK+10h,SP
						STM				#00E0h,PMST

						SSBX			INTM

						CALL			System_Init
						CALL			McBSP_Init



						SSBX			FRCT
						STM				#Buffer_New,AR2
						STM				#(Buffer_Old+FIR_Length/2-1),AR3
						STM				#(FIR_Length/2),BK
						STM				#-1,AR0

						RSBX			INTM


												
LOOP:					BANZ			LOOP,*AR5
						CALL			LPF
						B				LOOP

						.end