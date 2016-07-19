; Code for Audio FIR low pass filting
; Fs=44100Hz, Fpass=500Hz, Fstop=1500Hz
; File Name: DeNoiseMain.asm
; Date: 1st July, 2015
; Author: Cui Ao, Li Shangwen
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

LPFCOEFF				.word			0xffff,0xffff,0xffff,0xffff,0xffff
						.word			0xffff,0xffff,0xffff,0xffff,0xffff
						.word			0xffff,0xffff,0xffff,0xffff,0xffff
						.word			0xffff,0x0000,0x0000,0x0001,0x0001
						.word			0x0002,0x0002,0x0003,0x0003,0x0004
						.word			0x0005,0x0005,0x0006,0x0006,0x0006
						.word			0x0006,0x0006,0x0005,0x0005,0x0004
						.word			0x0002,0x0001,0xffff,0xfffd,0xfffb
						.word			0xfff8,0xfff6,0xfff3,0xfff0,0xffee
						.word			0xffeb,0xffe9,0xffe7,0xffe5,0xffe4
						.word			0xffe3,0xffe3,0xffe4,0xffe6,0xffe8
						.word			0xffec,0xfff0,0xfff5,0xfffb,0x0002
						.word			0x000a,0x0012,0x001a,0x0023,0x002c
						.word			0x0035,0x003d,0x0045,0x004c,0x0052
						.word			0x0056,0x0059,0x0059,0x0058,0x0054
						.word			0x004e,0x0046,0x003b,0x002d,0x001d
						.word			0x000b,0xfff7,0xffe0,0xffc9,0xffb0
						.word			0xff97,0xff7e,0xff66,0xff4f,0xff3a
						.word			0xff27,0xff17,0xff0c,0xff05,0xff03
						.word			0xff07,0xff11,0xff22,0xff39,0xff58
						.word			0xff7e,0xffac,0xffe1,0x001c,0x005f
						.word			0x00a7,0x00f5,0x0148,0x019f,0x01f9
						.word			0x0255,0x02b2,0x030f,0x036a,0x03c3
						.word			0x0418,0x0469,0x04b4,0x04f7,0x0534
						.word			0x0567,0x0591,0x05b1,0x05c7,0x05d2
						.word			0x05d2,0x05c7,0x05b1,0x0591,0x0567
						.word			0x0534,0x04f7,0x04b4,0x0469,0x0418
						.word			0x03c3,0x036a,0x030f,0x02b2,0x0255
						.word			0x01f9,0x019f,0x0148,0x00f5,0x00a7
						.word			0x005f,0x001c,0xffe1,0xffac,0xff7e
						.word			0xff58,0xff39,0xff22,0xff11,0xff07
						.word			0xff03,0xff05,0xff0c,0xff17,0xff27
						.word			0xff3a,0xff4f,0xff66,0xff7e,0xff97
						.word			0xffb0,0xffc9,0xffe0,0xfff7,0x000b
						.word			0x001d,0x002d,0x003b,0x0046,0x004e
						.word			0x0054,0x0058,0x0059,0x0059,0x0056
						.word			0x0052,0x004c,0x0045,0x003d,0x0035
						.word			0x002c,0x0023,0x001a,0x0012,0x000a
						.word			0x0002,0xfffb,0xfff5,0xfff0,0xffec
						.word			0xffe8,0xffe6,0xffe4,0xffe3,0xffe3
						.word			0xffe4,0xffe5,0xffe7,0xffe9,0xffeb
						.word			0xffee,0xfff0,0xfff3,0xfff6,0xfff8
						.word			0xfffb,0xfffd,0xffff,0x0001,0x0002
						.word			0x0004,0x0005,0x0005,0x0006,0x0006
						.word			0x0006,0x0006,0x0006,0x0005,0x0005
						.word			0x0004,0x0003,0x0003,0x0002,0x0002
						.word			0x0001,0x0001,0x0000,0x0000,0xffff
						.word			0xffff,0xffff,0xffff,0xffff,0xffff
						.word			0xffff,0xffff,0xffff,0xffff,0xffff
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
						FIRS			*AR2+0%,*AR3+0%,LPFCOEFF
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
