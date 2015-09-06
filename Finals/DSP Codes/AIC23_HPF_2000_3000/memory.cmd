MEMORY
{
PAGE 0:
		PRORESERVED0:	origin = 00000h, length = 0080h
		PRODARAM:		origin = 03000h, length = 1000h
		PROROM:			origin = 0F000h, length = 0F00h
		PRORESERVED1:	origin = 0FF00h, length = 0080h
		INTVECTOR:		origin = 00080h, length = 0080h
PAGE 1:
		MMREG:			origin = 00000h, length = 0060h
		//TEMPREG:		origin = 00060h, length = 0020h
		//DATAREST:		origin = 00080h, length = 0f80h
		DATADARAM:		origin = 01000h, length = 2000h

}

SECTIONS
{
		LPFCOEFF:					>PRODARAM				PAGE 0
		.text:						>PRODARAM				PAGE 0
		.intvectors:				>INTVECTOR				PAGE 0
		.bss:						>DATADARAM				PAGE 1
		Buffer_Old:	align (128) {} 	>DATADARAM				PAGE 1
		Buffer_New:	align (128) {}	>DATADARAM				PAGE 1
		STACK:						>DATADARAM				PAGE 1
}