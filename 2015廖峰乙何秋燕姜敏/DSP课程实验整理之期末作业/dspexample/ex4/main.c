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
	asm	("	STM #5h, AR0	");//AR0=5h
	asm	("	STM #1500h, AR1	");//AR1=1500h
	asm	("	STM #1500h, AR2	");//AR2=1500h
//---2
	asm	("	STM #157Ah, AR3	");//AR3=157Ah
	asm	("	LDM *AR3, A	");//AR3=7Ah, A=(7Ah)
	asm	("	DST A, *AR2+	");//(1500h)=0,(1501h)=(7Ah),AR2=1502h
//---3
	asm	("	LDM AR3, A	");//A=7Ah
	asm	("	DST A, *AR2+	");//(1502h)=0,(1503h)=7Ah,AR2=1504h
//---4
	asm	("	LDM 007Ah, A	");//A=(7Ah)
	asm	("	DST A, *AR2+	");//(1504h)=0,(1505h)=(7Ah),AR2=1506h
//---5
	asm	("	ST #8888h, *AR1+0	");//(1500h)=8888h,AR1=AR1+AR0=1505h
	asm	("	LD *AR1, A	");//A=(1505h)=(7Ah)
	asm	("	DST A, *AR2+	");//(1506h)=0,(1507h)=(7Ah),AR2=1508h
	asm	("	LDM AR1, A	");//A=1505h
	asm	("	DST A, *AR2+	");//(1508h)=0,(1509h)=1505h,AR2=150Ah
/**/
}




