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
//---1 整数乘法
	asm	("	STM #1500H, AR1	");//AR1=1500H
	asm	("	ST #2000H, *AR1	");//(AR1)=(1500H)=2000H
	asm	("	RSBX FRCT	");//清FTCT标志位准备整数乘
	asm	("	LD *AR1+, T	");//T=(AR1)
	asm	("	MPY #-2, A	");//A=-2*T
	asm	("	STL A, *AR1+	");//(1501H)=A(15~0)
	asm	("	DST A, *AR1+	");//(1502H)(1503H)=A
//---2 小数乘法
	asm	("	SSBX SXM	");//SXM=1
	asm	("	ST #0E000H, *AR1+	");//(1504H)=E000H=-0.25
	asm	("	ST #1000H, *AR1+	");//(1505H)=1000H=0.125
	asm	("	SSBX FRCT	");//置FTCT标志位准备小数乘
	asm	("	STM #1504H, AR2	");//AR2=1504H
	asm	("	LD *AR2+, 16, A	");//A(31~16)=(AR2)
	asm	("	MPYA *AR2	");//A(31~16)*(AR2)-->B(31~16)
	asm	("	STH A, *AR1+	");//(1506H)=A=-0.25
	asm	("	STH B, *AR1+	");//(1507H)=B=-0.03125
//---3 商为小数的除法
	asm	("	ST #2CH, *AR1+	");//(1508H)=2CH=44
	asm	("	ST #0FF50H, *AR1+	");//(1509H)=-176
	asm	("	RSBX FRCT	");//清FTCT标志位准备整数乘
	asm	("	STM #1509H, AR2	");//AR2=1509H
	//加载除数-176，与被除数做乘法
	asm	("	LD *AR2-, 16, A	");//A(31~16)=(AR2)=-176
	asm	("	MPYA *AR2+	");//A(31~16)*(AR2)-->B(15~0)
	//存除数的绝对值
	asm	("	ABS A	");//将除数取绝对值A(31~16)=176
	asm	("	STH A, *AR2-	");//将绝对值放回原位
	//加载被除数44，取绝对值，做除法
	asm	("	LD *AR2+, 16, A	");//A(31~16)=44
	asm	("	ABS A	");//取绝对值A(31~16)=44
	asm	("	RPT #14	");//下一条指令重复执行(14+1)次
	asm	("	SUBC *AR2, A	");//条件减法
	asm	("	XC 1, BLT	");//如果B<0，执行NEG指令
	asm	("	NEG A	");//商为负
	asm	("	STL A, *AR1+	");//存商(1510H)=A
/**/
}




