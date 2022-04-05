; interrupt.asm
;   Contains interrupt related functionality

.proc enable_interrupts
    ; enable interrupt
    ldy #<vvblkd_interrupt
    ldx #>vvblkd_interrupt
    lda #7
    jsr SETVBV

    ;setup VVBLKD interrupt chain
vvblkd_interrupt
	lda #<vvblkd_chain
	sta VVBLKD
	lda #>vvblkd_chain
	sta VVBLKD+1

    rts
.endp

;
; vvblkd chain
;	method chains for VVBLKD interupts
.local vvblkd_chain
	read_joystick()
	animate_tilesprite()
	play_background_music()
    ; key collection sfx
	play_sfx SFX1, AF1C
	jmp XITVBV
.endl
