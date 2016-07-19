
					.title			"timer2.asm"
					.mmregs
					
					.bss           aa,1
					.bss           bb,1
					.bss           cc,1
					.bss           y1,1
					.bss           y2,1
					.bss           y0,1

STACK               .usect         "STACK",10h
out					.usect			"out",1024
out1                .usect			"out1",1024

					.def		_c_int00
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
					.def		_c_int22_SINT6
					.def		_c_int23_TINT1
					.def		_c_int24_INT3

				
					.text

_c_int00:	STM         #STACK+10h,SP
			SSBX		FRCT
			ST			#79BCh,aa
			ST			#0C000h,bb
			ST			#13C7h,cc
            PSHD		cc
			POPD		y2
			LD          *(aa),T
			MPY         *(y2),A
			STH         A,y1
			STM			#out,AR1
			STM			#out1,AR2
			LD  		#0,DP
			SSBX        INTM
			;LD          #_c_int19_TINT0,A
			;AND			#0FF80h,A
			;OR          PMST,A
			;STLM        A,PMST
			STM         #1060h,PMST
			STM	        #0010h,TCR      ;TSS=1 定时器停止工作
			STM  		#2710h,PRD		;加载周期寄存器PRD,定时中断周期 = CLKOUT*(TDDR+1)*(PRD+1)
			STM			#0C20h,TCR		;定时分频系数TDDR初始化为0，TSS=0，启动定时器，TRB等于1，当TIM减到0后
										;重新加载PRD,soft= 1,Free= 1，定时器遇到断电后继续执行
			STM			#0008h,IFR		;清除尚未处理完的定时器中断
			STM			#0008h,IMR      ;开放定时器中断
			RSBX        INTM 			;开放中断
					
LOOP:	    ST      #1,y0
			BC		LOOP,AGEQ
LOOP2:      ST      #-1,y0
			BC      LOOP2,ALT
			BC      LOOP,AGEQ
			RESET	;软件复位CPU

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
					NOP
					MVKD    *(y0),*AR2+
					LD		*(bb),T
                    MPY     *(y2),A
					LTD     *(y1)
					MAC     *(aa),A
					STH     A,1,y1
					STH     A,1,y0
					MVKD    *(y0),*AR1+
					RETE
_c_int20_BRINT0:		NOP
					    RETE

_c_int21_BXINT0:		NOP
						RETE

_c_int22_SINT6:		NOP
					RETE

_c_int23_TINT1:		NOP
					RETE

_c_int24_INT3:		NOP
					RETE

					

			.end
