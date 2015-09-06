#include "cpu_reg.h"

int ADbuf[1024];
extern int DA_wptr,DA_rptr,y,Flag,temp;
extern int play_mode;


void write_subreg0(unsigned int addr,unsigned int val);
unsigned int read_subreg0(unsigned int addr);

unsigned int read_subreg0(unsigned int addr)
{
       *(SPSA0)=addr;
       return(*SPSD0);
} 
    
void write_subreg0(unsigned int addr,unsigned int val)
{
      *(SPSA0)=addr;
      *(SPSD0)=val;
}  

void McBsp0_init()
{

     write_subreg0(SPCR1,0);
     write_subreg0(SPCR2,0);

     write_subreg0(SPCR1,SPCR10_VAL);
     write_subreg0(SPCR2,SPCR20_VAL);
     write_subreg0(PCR,PCR0_VAL);

     write_subreg0(RCR1,RCR10_VAL);
     write_subreg0(RCR2,RCR20_VAL);
     write_subreg0(XCR1,XCR10_VAL);
     write_subreg0(XCR2,XCR20_VAL);
     delay(10);
     
     *(DXR10)=0;
     
     /*now enable McBSP transmit and receive*/
     write_subreg0(SPCR1,SPCR10_VAL|1);
     write_subreg0(SPCR2,SPCR20_VAL|1);
     delay(10);
     
     *(IMR)|=0x0010;    //开接收0中断
     
}     

void delay(int k)
{
   while(k--);
}

interrupt void  codec_ch0_in() //接收0中断
{
      Flag=1;  
      temp=*DRR10;
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
	 
      *DXR10=y;
	  DA_rptr++;
      if(DA_rptr>=1024)
            DA_rptr=0;

      ADbuf[DA_rptr]=y;   //保存录音数据
}
