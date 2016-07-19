MEMORY
{
  PAGE 0:
        EPROM : org=0x80,len=1000h
        VECS  : org=0xFF80,len=0080h
  PAGE 1:
        SPRAM : org=0060h,len=0020h
        DARAM : org=00100h,len=1000h
}
SECTIONS
{
  .text :>EPROM  PAGE 0
  .data :>EPROM  PAGE 0
  .bss  :>SPRAM  PAGE 1
  a0 : align (128) { } > DARAM PAGE 1
  xn : align (128) { } > DARAM PAGE 1
    .vectors : >VECS  PAGE 0
}