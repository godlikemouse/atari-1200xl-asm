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
	read_game_joystick()
    read_mainmenu_joystick()
	animate_tilesprite()
    draw_mainmenu()
    draw_intro()
    draw_gameover()
    
	play_background_music()
	play_sfx SFX1, AF1C
    play_sfx SFX2, AF2C
	jmp XITVBV
.endl
