MEMORY
{
  PAGE 0:
        EPROM : org=0300h, len=100h
        intvectors  : org=0280h, len=80h
	    
  PAGE 1:
        SPRAM : org=0060h, len=20h
        DARAM : org=0080h, len=100h
}
SECTIONS
{
  .text  : >EPROM  PAGE 0
  .data  : >EPROM  PAGE 0
  .intvectors : >intvectors  PAGE 0
  .bss   : >SPRAM  PAGE 1
  STACK  : >DARAM  PAGE 1

}