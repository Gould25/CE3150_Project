#include <reg932.inc>

cseg at 0			; tells the assembler to place the first
				; instruction at address 0
	mov 0x84,#0		; set Port 0 to bi-directional
	mov 0x91,#0		; set Port 1 to bi-directional
	mov 0xA4,#0		; set Port 2 to bi-directional
	mov sp,#0x80		; initialize stack pointer to 0x80
loop:				; label for the sjmp instruction
	mov c,p2.0		; move switch 1 to c flag
	jnc red_led1		; jump to red_led1 label if sw1 pressed
	mov c,p0.1		; move switch 2 to c flag
	jnc yellow_led2		; jump to yellow_led2 label if sw2 pressed
	sjmp loop		; jump to loop if no switches pressed
red_led1:			; red_led1 label
	mov r0,#0x10		; set number of times to flash led
red_loop1:			; led flash loop label 
	cpl p2.4		; switches the red LED1 on or off
	acall delay		; calls delay subroutine
	djnz r0,red_loop1	; decrements r0 and loops until r0=0
	setb p2.4		; makes sure red LED1 is off
	sjmp loop		; jumps back to start of program
yellow_led2:			; yellow_led2 label
	mov r0,#0x10		; set number of times to flash led
ylw_loop2:			; led flash loop label 
	cpl p0.5		; switches the yellow LED2 on or off
	acall delay		; calls delay subroutine
	djnz r0,ylw_loop2	; decrements r0 and loops until r0=0
	setb p0.5		; makes sure yellow LED2 is off
	sjmp loop		; jumps back to start of program

; Start of Delay Subroutine
delay:				; delay subroutine label
	mov R3,#10		; initial value for delay_loop2
delay_loop2:			; start of delay_loop2
	mov R2,#100		; initial value for delay_loop1
delay_loop1:			; start of delay_loop1
	mov R1,#255		; initial value for delay_loop0
delay_loop0:			; start of delay_loop0
	nop			; two nops take two processor clock
	nop			; cycles to execute
	djnz R1,delay_loop0	; end of delay_loop0
	djnz R2,delay_loop1	; end of delay_loop1
	djnz R3,delay_loop2	; end of delay_loop2
	ret			; return instruction
; End of Delay Subroutine
end
