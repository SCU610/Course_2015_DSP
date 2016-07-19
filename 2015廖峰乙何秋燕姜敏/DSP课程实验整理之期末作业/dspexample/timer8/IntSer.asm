;文件名:			IntSer.asm
;描述:				TMSC54x系列DSP用于CCS的中断向量编程及多文件汇编源程序
;作者:				Cui Ao
;创建日期:			2015年5月6日
;最后修改日期:		2015年5月6日


;工程目录：			IntSer.asm---------------------中断服务汇编文件
;					IntsExp.asm--------------------主汇编文件，芯片复位入口(_c_int00)
;					IntVectors.asm-----------------中断向量文件
;					memory.cmd---------------------内存分配命令文件

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
					.def		_c_int22_SINT6
					.def		_c_int23_TINT1
					.def		_c_int24_INT3

					.ref            TCR1
					.ref            PRD1
					 
					.text

;******************************************************************************
;							开    始
;******************************************************************************

;按照.def中的定义，编写从1号中断到15号中断的空服务程序

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

_c_int18_INT2:	    NOP
					RETE			

_c_int19_TINT0:		   NOP
					   NOP
					   NOP
					   RSBX	XF
					   STM   #0h,*AR1
					   STM  #0000h,IMR
					   STM  #0010h,TCR
					   STM  #0010h,TCR1
					   STM  #0FFFFh,PRD1
					   STM  #0C2Fh,TCR1
					   STM  #0080h,IFR
					   STM  #0080h,IMR
					   RETE

_c_int20_BRINT0:	NOP
					RETE

_c_int21_BXINT0:	NOP
					RETE

_c_int22_SINT6:		NOP
					RETE

_c_int23_TINT1:		   NOP
				       NOP
					   NOP
					   SSBX	XF
					   STM   #1h,*AR1
					   STM  #0000h,IMR
					   STM  #0010h,TCR1
					   STM  #0010h,TCR
					   STM  #0FFFFh,PRD
					   STM  #0C2Fh,TCR
					   STM  #0008h,IFR
					   STM  #0008h,IMR
					   RETE

_c_int24_INT3:		NOP
					RETE

;******************************************************************************
;							结    束
;******************************************************************************

					.end