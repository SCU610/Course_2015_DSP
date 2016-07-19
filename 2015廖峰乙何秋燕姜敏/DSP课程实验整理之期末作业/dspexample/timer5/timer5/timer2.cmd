MEMORY
{
  PAGE 0:
        EPROM : org=0FFAh, len=100h
        vec  : org= 0ff80h, len=60h
	    
  PAGE 1:
        SPRAM : org=0060h, len=20h
        DARAM : org=0080h, len=880h
}
SECTIONS
{
  .text  : >EPROM  PAGE 0
  .data  : >EPROM  PAGE 0
  .timer_vectors : >EPROM  PAGE 0
  STACK  : >DARAM  PAGE 1
  out    : >DARAM  PAGE 1
  out1    : >DARAM  PAGE 1
  .bss   : >SPRAM  PAGE 1
}