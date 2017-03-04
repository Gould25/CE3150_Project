#include <reg932.inc>

cseg at 0			; tells the assembler to place the first
				; instruction at address 0
	mov 0xA4,#0		; set Port 2 to bi-directional
	mov 0x91,#0		; set Port 1 to bi-directional
	mov 0x84,#0		; set Port 0 to bi-directional
loop:				; label for the sjmp instruction
	mov c,p2.0		; move switch 1 to c flag
	jnc led_on		; jump to led_on label if c=0
	jc led_off		; or jump to led_off label if c=1
led_on:			        ; led_on label
	clr p2.4		; switches the red LED1 on
	sjmp loop		; jumps back to start of program
led_off:			; led_off label
	setb p2.4		; switches the red LED1 off
	sjmp loop		; jumps back to the start of the program
end
