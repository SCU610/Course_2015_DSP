			.title		"sound1.asm"   ;N=50
			.mmregs
			.def		_c_int00
			.bss		y,1
a0			.usect		"a0",11
xn 			.usect      "xn",11

PA0     	.set        0
PA1			.set		1
			.data

table       .word    118,256,-1227,-1095,9358,17948,9358,-1095,-1227,256,118   ;N = 10
                 
			.text
_c_int00:   SSBX		FRCT
		    STM		    #a0,AR1
		    RPT 		#10
		    MVPD        table,*AR1+
		    STM		    #xn+10,AR3
		    STM         #a0+10,AR4
		    STM         #11,BK
		    STM		    #-1,AR0
		    LD 		    #xn,DP
		    PORTR       PA1,@xn
FIR:	    RPTZ        A,#10
		    MAC         *AR3+0%,*AR4+0%,A
		    STH	 	    A,@y
		    PORTW       @y,PA0
		    BD          FIR
		    PORTR       PA1,*AR3+0%
		    .END