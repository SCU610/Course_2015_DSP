					.title			"Ints.asm"
					.mmregs

					.def			_c_int00

					.def            TCR1
					.def            PRD1
					;.def            CLKMD
TCR1				.set            0032h
PRD1				.set            0031h
;CLKMD               .set            0058h
STACK				.usect			"STACK",80h
					.bss			y,1
					
					.text

;******************************************************************************
;							开    始
;******************************************************************************

_c_int00:		STM  #0000h,CLKMD
				RPT  #100h
				NOP
				STM  #0FC00h,CLKMD
				SSBX XF
                ST   #1,y
				STM   y,AR1
				LD   #0h,DP
				STM  #20E0h,PMST
				SSBX INTM	;关闭所有中断
				STM  #0010h,TCR
				STM  #0FFFFh,PRD
				STM  #002Fh,TCR
				STM  #0008h,IFR
				STM  #0008h,IMR						
				RSBX INTM	;打开所有中断
					
LOOP:			NOP
				B				LOOP
				RESET	;软件复位CPU
					

;******************************************************************************
;							结    束
;******************************************************************************

				.end
