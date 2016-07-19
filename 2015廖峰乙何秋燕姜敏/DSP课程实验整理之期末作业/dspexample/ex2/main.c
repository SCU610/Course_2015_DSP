#include "cpu_reg.h"
#include "common.h"

int sd[20];
int i;

void main()					//主函数
{
	init_dsp(); 			//dsp初始化

	for(i = 0; i < 20; i ++)
	{
		sd[i] = i;
	}

	while(1)				//大循环
	{
		LED_flash();       	//灯闪烁
	}
}  

