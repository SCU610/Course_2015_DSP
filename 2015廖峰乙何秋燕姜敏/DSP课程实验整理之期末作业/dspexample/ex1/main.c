#include "cpu_reg.h"
#include "common.h"

void main()					//主函数
{
	init_dsp(); 			//dsp初始化
	while(1)				//大循环
	{					 
		LED_flash();
	}				
}  

