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
	asm	("	LD #12H, 8, A	");//A=1200H
	asm	("	LD #18H, 8, B	");//B=1800H
	asm	("	SUB #12345, 8, A, B	");//B=A-303900H
	asm	("	STM #1500H, AR1	");//AR1=1500H
	asm	("	DST A, *AR1+	");//(1500H)(1501H)=A
	asm	("	DST B, *AR1+	");//(1502H)(1503H)=B
//---2
	asm	("	ST #41H, *AR1+	");//(1504H)=41H=65
	asm	("	ST #7H, *AR1+	");//(1505H)=7H=7
	asm	("	STM #1504H,AR2	");//AR2=1504H
	asm	("	LD *AR2+, B	");//B=41H
	asm	("	RPT #15	");//SUBC重复执行15+1次
	asm	("	SUBC *AR2, B	");//使用SUBC指令完成除法
	asm	("	STL B, *AR1+	");//存商
	asm	("	STH B, *AR1+	");//存余数
//---3
	asm	("	ST #3852H, *AR1+	");//(1508H)=3852H=0.44
	asm	("	ST #1C29H, *AR1+	");//(1509H)=1C29H=0.22
	asm	("	STM #1508H,AR2	");//AR2=1508H
	asm	("	LD *AR2+, B	");//B=3852H
	asm	("	RPT #15	");//SUBC重复执行15+1次
	asm	("	SUBC *AR2, B	");//使用SUBC指令完成除法
	asm	("	STL B, *AR1+	");//存商
	asm	("	STH B, *AR1+	");//存余数
//---4
	asm	("	ST #2CH, *AR1+	");//(150CH)=2CH=44
	asm	("	ST #0B0H, *AR1+	");//(150DH)=0B0H=176
	asm	("	STM #150CH,AR2	");//AR2=150CH
	asm	("	LD *AR2+,15, B	");//B=2CH<<15
	asm	("	RPT #15	");//SUBC重复执行15+1次
	asm	("	SUBC *AR2, B	");//使用SUBC指令完成除法
	asm	("	STL B, *AR1+	");//存商
	asm	("	STH B, *AR1+	");//存余数
/**/
}




