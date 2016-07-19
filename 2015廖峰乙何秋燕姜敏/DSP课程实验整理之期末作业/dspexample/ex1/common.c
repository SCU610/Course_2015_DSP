#include "cpu_reg.h"

void init_dsp()		//初始化dsp
{
	asm	("	STM		#0000h,	CLKMD  	");  	//设置PLL时钟模式，关闭PLL
	while(*CLKMD & 0x01 );					//等待直到关闭PLL
	asm	("  STM 	#5007h, CLKMD  	"); 	//设置时钟模式PLLx6，16.9344x6=101.6，即设置CPU运行频率＝101M
	asm	("  STM 	#4240h, SWWSR  	");		//设置软件等待状态寄存器，XPA=0，I/O=100，Data=001001，Program=0
	asm	("  STM 	#00a0h, PMST  	");  	//设置进程模式状态寄存器，IPTR=001h，MP/MC=0，ovly=1  
	asm	("  STM 	#0802h, BSCR  	"); 	//设置Bank-Switching控制寄存器，BNKCMP=0，PS-DS=1，HBH=0，BH=1，EXIO=0
}

void delay(int k)
{
	int i;
	long j;
	for(i=0;i<k;i++)
		for(j=0;j<7400;j++);
}

void LED_flash()
{
	asm("  RSBX  XF "); //亮200ms
	delay(300);
	asm("  SSBX  XF "); //灭800ms
	delay(300);
}





