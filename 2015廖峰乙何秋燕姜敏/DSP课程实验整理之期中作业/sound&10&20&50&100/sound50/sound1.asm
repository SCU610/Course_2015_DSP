			.title		"sound1.asm"   ;N=50
			.mmregs
			.def		_c_int00
			.bss		y,1
a0			.usect		"a0",51
xn 			.usect      "xn",51

PA0     	.set        0
PA1			.set		1

			.data
table       .word    -24,-21,38,16,-67,0,111,-44,-161,132,196,-274,-186,471,93,-712,134,976,-564,-1233,1347,1447        
            .word    -3002,-1590,10278,18046,10278,-1590,-3002,1447,1347,-1233,-564,976,134,-712,93,471,-186,-274
            .word    196,132,-161,-44,111,0,-67,16,38,-21,-24     

			.text
_c_int00:   SSBX		FRCT
		    STM		    #a0,AR1
		    RPT 		#50
		    MVPD        table,*AR1+
		    STM		    #xn+50,AR3
		    STM         #a0+50,AR4
		    STM         #51,BK
		    STM		    #-1,AR0
		    LD 		    #xn,DP
		    PORTR       PA1,@xn
FIR:	    RPTZ        A,#50
		    MAC         *AR3+0%,*AR4+0%,A
		    STH	 	    A,@y
		    PORTW       @y,PA0
		    BD          FIR
		    PORTR       PA1,*AR3+0%
		    .END