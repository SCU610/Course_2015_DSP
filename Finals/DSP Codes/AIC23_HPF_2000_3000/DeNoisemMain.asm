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

HPFCOEFF				.word			0xffff,0xffff,0xffff,0xffff,0xffff
						.word			0xffff,0x0000,0x0000,0x0000,0x0000
						.word			0x0001,0x0001,0x0001,0x0000,0x0000
						.word			0xffff,0xfffe,0xfffd,0xfffd,0xfffd
						.word			0xfffd,0xfffd,0xfffe,0xffff,0x0001
						.word			0x0003,0x0004,0x0005,0x0006,0x0006
						.word			0x0004,0x0002,0xffff,0xfffc,0xfff8
						.word			0xfff5,0xfff3,0xfff3,0xfff4,0xfff7
						.word			0xfffb,0x0001,0x0008,0x000e,0x0013
						.word			0x0016,0x0016,0x0013,0x000d,0x0005
						.word			0xfffb,0xfff0,0xffe6,0xffde,0xffda
						.word			0xffda,0xffe0,0xffeb,0xfffa,0x000b
						.word			0x001c,0x002c,0x0037,0x003c,0x003a
						.word			0x002f,0x001c,0x0004,0xffe9,0xffcd
						.word			0xffb6,0xffa6,0xffa1,0xffa8,0xffbb
						.word			0xffd9,0x0000,0x002a,0x0053,0x0074
						.word			0x008a,0x008e,0x0080,0x0060,0x002f
						.word			0xfff4,0xffb4,0xff78,0xff48,0xff2c
						.word			0xff2a,0xff44,0xff79,0xffc6,0x0023
						.word			0x0084,0x00dd,0x0122,0x0148,0x0146
						.word			0x0117,0x00be,0x0041,0xffac,0xff10
						.word			0xfe81,0xfe13,0xfdd9,0xfde2,0xfe36
						.word			0xfed5,0xffb9,0x00ce,0x01fa,0x031d
						.word			0x0411,0x04ac,0x04c6,0x0433,0x02c8
						.word			0x004a,0xfc4d,0xf5c3,0xe8a3,0xafce
						.word			0x5031,0x175c,0x0a3c,0x03b2,0xffb5
						.word			0xfd37,0xfbcc,0xfb39,0xfb53,0xfbee
						.word			0xfce2,0xfe05,0xff31,0x0046,0x012a
						.word			0x01c9,0x021d,0x0226,0x01ec,0x017e
						.word			0x00ef,0x0053,0xffbe,0xff41,0xfee8
						.word			0xfeb9,0xfeb7,0xfedd,0xff22,0xff7b
						.word			0xffdc,0x0039,0x0086,0x00bb,0x00d5
						.word			0x00d3,0x00b7,0x0087,0x004b,0x000b
						.word			0xffd0,0xff9f,0xff7f,0xff71,0xff75
						.word			0xff8b,0xffac,0xffd5,0xffff,0x0026
						.word			0x0044,0x0057,0x005e,0x0059,0x0049
						.word			0x0032,0x0016,0xfffb,0xffe3,0xffd0
						.word			0xffc5,0xffc3,0xffc8,0xffd3,0xffe3
						.word			0xfff4,0x0005,0x0014,0x001f,0x0025
						.word			0x0025,0x0021,0x0019,0x000f,0x0004
						.word			0xfffa,0xfff2,0xffec,0xffe9,0xffe9
						.word			0xffec,0xfff1,0xfff7,0xfffe,0x0004
						.word			0x0008,0x000b,0x000c,0x000c,0x000a
						.word			0x0007,0x0003,0x0000,0xfffd,0xfffb
						.word			0xfff9,0xfff9,0xfffa,0xfffb,0xfffc
						.word			0xfffe,0x0000,0x0001,0x0002,0x0002
						.word			0x0002,0x0002,0x0002,0x0001,0x0000
						.word			0xffff,0xffff,0xfffe,0xfffe,0xfffe
						.word			0xffff,0xffff,0xffff,0xffff,0x0000
						.word			0x0000,0x0000,0x0000,0x0000,0x0000



						.data

						.bss			CurrentInput,1
						.bss			CurrentOutput,1


STACK					.usect			"STACK",10h

Buffer_Old				.usect			"Buffer_Old",FIR_Length/2
Buffer_New				.usect			"Buffer_New",FIR_Length/2

						.text

LPF:					MVKD			*(CurrentInput),*AR2
						RPTZ			B,#(FIR_Length/2-1)
						FIRS			*AR2+0%,*AR3+0%,HPFCOEFF
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