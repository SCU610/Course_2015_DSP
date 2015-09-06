#include "cpu_reg.h"



int     x_new[64]={0,0,0,0,0,0,0,0,
				   0,0,0,0,0,0,0,0,
				   0,0,0,0,0,0,0,0,
				   0,0,0,0,0,0,0,0,
				   0,0,0,0,0,0,0,0,
				   0,0,0,0,0,0,0,0,
				   0,0,0,0,0,0,0,0,
				   0,0,0,0,0,0,0,0};
int		x_old[64]={0,0,0,0,0,0,0,0,
				   0,0,0,0,0,0,0,0,
				   0,0,0,0,0,0,0,0,
				   0,0,0,0,0,0,0,0,
				   0,0,0,0,0,0,0,0,
				   0,0,0,0,0,0,0,0,
				   0,0,0,0,0,0,0,0,
				   0,0,0,0,0,0,0,0};
int     coef[64]={0x0ffdc,0x0001f,0x00051,0x0ffe9,0x0ffe6,
                  0x0ffba,0x0ffb4,0x0004b,0x0fff9,0x00069,
                  0x000a2,0x0ff6f,0x0fffe,0x0ff70,0x0fef4,
                  0x000cb,0x0000b,0x000e6,0x00187,0x0fee5,
                  0x0000b,0x0fe7f,0x0fdbf,0x00192,0x0ffb5,
                  0x0026a,0x00368,0x0fdc2,0x000c0,0x0fc0a,
                  0x0faa3,0x00347,0x0fe3d,0x00747,0x009bb,
                  0x0fa3d,0x0052b,0x0eb59,0x0dc2a,0x02d57,
                  0,0,0,0,0,0,0,0,
                  0,0,0,0,0,0,0,0,
                  0,0,0,0};
int 	ms,f=1;
int 	DA_wptr,DA_rptr,y,temp;
int		Flag = 0;
int		play_mode;
int 	AR2_VALE=0;
int		AR3_VALE=0;
int		AH=0;
int		AL=0;
asm("  STM #0000h,CLKMD ");
void FIR(); 
void main()
{
     asm("  STM #0000h,CLKMD ");  
     while(*CLKMD & 0x01 );
     asm("  STM #40c7h,CLKMD ");
     
/*  40C7h:5*clkin  =100M
    30c7h:4*clkin  =80M
    20c7h:3*clkin  =60M
    10C7h:2*clkin  =40M
*/

     asm("  stm   #4240h, SWWSR ");
     //2 wait except for on-chip program 1
     asm("  stm   #00a0h, PMST  "); //MP/MC = 0, IPTR = 001,ovly=1  
     asm("  stm   #0802h, BSCR  "); 
     asm("  STM #0h,IMR ");
     
    

     
	
     
     McBsp0_init();             //串口初始化
     
     asm("  RSBX  INTM ");      /*开中断*/ 
     
     play_mode=0;              //发警报声
	 Flag=0;
     asm("  SSBX    FRCT ");
	 asm("  STM     #1700h,AR2 ");
	 asm("  STM     #1740h+(40-1),AR3 ");
	 asm("  STM     #17c5h,AR5 ");   //temp
	 //asm("	STM		#17CAh,AR4 ");   //ADbuf
	 asm("  STM     #40,BK ");
	 asm("  STM     #-1,AR0 ");
	 asm("  MVMD	   AR2,*(17c7h) ");
	 asm("  MVMD	   AR3,*(17c8h) ");
	 asm("  STM     #1700h,AR2 ");
	 asm("  RSBX     SXM ");
	 asm("  STH     A,*(17cah) ");
	 asm("  STL     A,*(17cbh) ");
     while(1)
     {	
     } 			 
}  

void FIR()
{
	asm("  LD	*(17CAh),16,A");
	asm("  STM     #-1,AR0 ");
	asm("  STM     #17c5h,AR5 ");   //temp
	asm("  MVDM     *(17c7h),AR2 ");
	asm("  MVDM     *(17c8h),AR3 ");
	asm("  RPTZ    B,#(40-1) ");
	asm("  FIRS    *AR2+0%,*AR3+0%,1780h ");
	asm("  STH     A,*(17cah) ");
	asm("  STH     B,*(17c4h) ");  //y
	asm("  MAR     *+AR2(1)% ");  
	asm("  MVDD    *AR2,*AR3+0% ");
	asm("  MVDD    *AR5,*AR2 ");
	asm("  MVMD	   AR2,*(17c7h) ");
	asm("  MVMD	   AR3,*(17c8h) ");
	
}	
