#include "cpu_reg.h"
#include "common.h"

void zhiling();

void main()					//主函数
{
	init_dsp(); 			//dsp初始化

	zhiling();				//学习指令

	while(1)				//大循环
	{
		LED_flash();       	//灯闪烁
	}
}  

void zhiling()
{
//---1
	asm	("	STM #1500H, AR1	");
	asm	("	LD #10H, 8, A	");//A=1000H
	asm	("	LD #0, B	");//B=0
	asm	("	STM #0400H, T	");//T=400H
	asm	("	RSBX FRCT	");//FRCT=0
	asm	("	MAC #345H, A, B	");//345H*T+A-->B
	asm	("	DST B, *AR1+	");
	asm	("	LD #0, B	");//B=0
	asm	("	SSBX FRCT	");//FRCT=1
	asm	("	MAC #345H, A, B	");//345H*T+A-->B
	asm	("	DST B, *AR1+	");
//---2
//	asm	("	RSBX FRCT	");//FRCT=0
	asm	("	LD #80H, 8, A	");//A=1000H
	asm	("	LD #04H, B	");//B=4H
	asm	("	STM #1501H, AR3	");//AR3=1501H
	asm	("	STM #1503H, AR4	");//AR4=1503H
	asm	("	MAC *AR3, *AR4, A, B	");//A+(AR3)*(AR4)-->B
	asm	("	DST B, *AR1+	");
	asm	("	LD #04H, B	");//B=4H
	asm	("	MACR *AR3, *AR4, A, B	");//A+(AR3)*(AR4)-->B
	asm	("	DST B, *AR1+	");
//---3
	asm	("	LD #1234H, 16, A	");//A=1234 0000H
	asm	("	LD #2H, 16, B	");//B=0002 0000H
	asm	("	STM #0444H, T	");//T=0444H
	asm	("	MACA T, A, B	");//A(31~16)*T+A-->B
	asm	("	DST B, *AR1+	");
	asm	("	MACA T, B, B	");//A(31~16)*T+B-->B
	asm	("	DST B, *AR1+	");
//---4
	asm	("	ST #8765H, *AR1+	");//(150CH)=8765H
	asm	("	ST #1234H, *AR1+	");//(150DH)=1234H
	asm	("	ST #1234H, *AR1+	");//(150EH)=1234H
	asm	("	ST #8765H, *AR1+	");//(150FH)=8765H
	asm	("	STM #150CH, AR3	");//AR3=150CH
	asm	("	STM #150EH, AR4	");//AR4=150EH
	asm	("	RSBX FRCT	");//FRCT=0
	asm	("	LD #10H, 8, A	");//A=1000H
	asm	("	STM #8H, T	");//T=8H
	asm	("	MACSU *AR3+, *AR4+, A	");//uns(AR3)*(AR4)+A-->A
	asm	("	DST A, *AR1+	");
	asm	("	MACSU *AR3+, *AR4+, A	");//uns(AR3)*(AR4)+A-->A
	asm	("	DST A, *AR1+	");
/**/
}




