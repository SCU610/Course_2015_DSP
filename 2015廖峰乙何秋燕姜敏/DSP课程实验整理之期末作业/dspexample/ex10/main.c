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

void zhiling()				//双操作数指令
{
//---1
	asm	("	STM #1500H, AR1	");//AR1=1500H
	asm	("	STM #1500H, AR3	");//AR3=1500H
	asm	("	LD #5678H, 16, A	");//A=5678 0000H
	asm	("	ADD #8933H, A	");//A=5678 8933H
	asm	("	ST #1534H, *AR1+	");//(1500H)=1534H
	asm	("	ST #9456H, *AR1+	");//(1501H)=9456H
	asm	("	SSBX C16	");//C16=1
	asm	("	DADD *AR3, A, B	");//(AR3)+A-->B
	asm	("	DST B, *AR1+	");//(1502H)(1503H)=B
	asm	("	RSBX C16	");//C16=0
	asm	("	DADD *AR3+, A, B	");//(AR3)+A-->B
	asm	("	DST B, *AR1+	");//(1504H)(1505H)=B
	asm	("	LDM AR3, A	");//A=AR3
	asm	("	DST A, *AR1+	");//(1506H)(1507H)=A
//---2
	asm	("	SSBX C16	");//C16=1
	asm	("	LD #1234H, 16, A	");//A=1234 0000H
	asm	("	ADD #5678H, A	");//A=1234 5678H
	asm	("	ST #5555H, *AR1+	");//(1508H)=5555H
	asm	("	ST #5555H, *AR1+	");//(1509H)=5555H
	asm	("	STM #1508H, AR3 	");//AR3=1508H
	asm	("	DRSUB *AR3, A	");//(AR3)-A(31~16)-->A(31~16)
	asm	("	DST A, *AR1+	");//(AR3+1)-A(15~0)-->A(15~0)
	asm	("	RSBX C16	");//C16=0
	asm	("	LD #1234H, 16, A	");//A=1234 0000H
	asm	("	ADD #5678H, A	");//A=1234 5678H
	asm	("	DRSUB *AR3+, A	");//(AR3)(AR3+1)-A-->A
	asm	("	DST A, *AR1+	");//(150CH)(150DH)=A
	asm	("	LDM AR3, A	");//A=AR3
	asm	("	DST A, *AR1+	");//(150EH)(150FH)=A
//---3
	asm	("	SSBX C16	");//C16=1
	asm	("	LD #1234H, 16, A	");//A=1234 0000H
	asm	("	ADD #5678H, A	");//A=1234 5678H
	asm	("	ST #6666H, *AR1+	");//(1510H)=6666H
	asm	("	ST #6666H, *AR1+	");//(1511H)=6666H
	asm	("	STM #1510H, AR3 	");//AR3=1510H
	asm	("	DSUB *AR3, A	");//A(31~16)-(AR3)-->A(31~16)
	asm	("	DST A, *AR1+	");//A(15~0)-(AR3+1)-->A(15~0)
	asm	("	RSBX C16	");//C16=0
	asm	("	LD #1234H, 16, A	");//A=1234 0000H
	asm	("	ADD #5678H, A	");//A=1234 5678H
	asm	("	DSUB *AR3+, A	");//A-(AR3)(AR3+1)-->A
	asm	("	DST A, *AR1+	");//(1514H)(1515H)=A
	asm	("	LDM AR3, A	");//A=AR3
	asm	("	DST A, *AR1+	");//(1516H)(1517H)=A
/**/
}




