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
	asm	("	STM #1500H, AR1	");//AR1=1500H
	asm	("	ST #1234H, *AR1	");//(1500H)=1234H
	asm	("	ADDM #0248H, *AR1+	");//(1500H)=147CH
//---2
	asm	("	ST #8007H,	*AR1	");//(1501H)=8007H
	asm	("	SSBX SXM	");//SXM=1
	asm	("	SSBX OVM	");//OVM=1
	asm	("	ADDM #0F088H, *AR1	");//(1501H)=8000H
//---3
	asm	("	LD #3H, A	");//A=3H
	asm	("	ADDS *AR1+, A	");//A=8000H+3H=8003H
	asm	("	DST A, *AR1+	");//(1502H)(1503H)=A
//---4
	asm	("	LD #12H, 8, A	");//A=1200H
	asm	("	ST #1500H, *AR1	");//(1504H)=1500H
	asm	("	ADD *AR1, 14, A	");//A+=(1504H)<<14
	asm	("	DST A, *AR1+	");//(1504H)(1505H)=A
//---5
	asm	("	LD #18H, 8, B	");//B=18H<<8=1800H
	asm	("	ADD A, -8, B	");//B+=A>>8
	asm	("	DST A, *AR1+	");//(1506H)(1507H)=A
	asm	("	DST B, *AR1+	");//(1508H)(1509H)=B
//---6
	asm	("	LD #12H, 8, A	");//A=12H<<8=1200H
	asm	("	LD #18H, 8, B	");//B=18H<<8=1800H
	asm	("	ADD #4568H, 8, A, B	");//B=4568H<<8+A
	asm	("	DST A, *AR1+	");//(150AH)(150BH)=A
	asm	("	DST B, *AR1+	");//(150CH)(150DH)=B
//---7
	asm	("	STM #1500H, AR2	");//AR2=1500H
	asm	("	STM #1501H, AR3	");//AR3=1501H
	asm	("	ADD *AR2-, *AR3+, A	");//A=AR2<<16+AR3<<16
	asm	("	DST A, *AR1+	");//(150EH)(150FH)=A
	asm	("	LDM AR2, A	");//A=AR2=14FFH
	asm	("	DST A, *AR1+	");//(1510H)(1511H)=A
	asm	("	LDM AR3, A	");//A=AR2=1502H
	asm	("	DST A, *AR1+	");//(1512H)(1513H)=A
//---8
	asm	("	LD #30H, A	");//A=30H
	asm	("	SSBX C	");//C=1
	asm	("	ADDC *+AR2(5), A	");//A=((14FF+5)H)
	asm	("	DST A, *AR1+	");//(1514H)(1515H)=A
	asm	("	LDM AR2, A	");//A=AR2=(14FF+5)H=1504H
	asm	("	DST A, *AR1+	");//(1516H)(1517H)=A
/**/
}




