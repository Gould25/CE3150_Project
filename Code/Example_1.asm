#include <reg932.inc>


cseg at 0			; tells the assembler to place the first
				; instruction at address 0
	mov 0xA4,#0		; set Port 2 to bi-directional
	mov 0x91,#0		; set Port 1 to bi-directional
	mov 0x84,#0		; set Port 0 to bi-directional
loop:				; label for the sjmp instruction
	mov c,p2.0		; move SW1 to red LED1
	mov p2.4,c		; through the c flag
	sjmp loop
end