			.title		"sound1.asm"   ;N=20
			.mmregs
			.def		_c_int00
			.bss		y,1
a0			.usect		"a0",21
xn 			.usect      "xn",21

PA0     	.set        0
PA1			.set		1

			.data
table       .word    -84,19,209,-183,-561,798,1048,-2517,-1474,10095
            .word    18066,10095,-1474,-2517,1048,798,-561,-183,209,19,-84   ;N = 20
		                
			.text
_c_int00:   SSBX		FRCT
		    STM		    #a0,AR1
		    RPT 		#20
		    MVPD        table,*AR1+
		    STM		    #xn+20,AR3
		    STM         #a0+20,AR4
		    STM         #21,BK
		    STM		    #-1,AR0
		    LD 		    #xn,DP
		    PORTR       PA1,@xn
FIR:	    RPTZ        A,#20
		    MAC         *AR3+0%,*AR4+0%,A
		    STH	 	    A,@y
		    PORTW       @y,PA0
		    BD          FIR
		    PORTR       PA1,*AR3+0%
		    .END