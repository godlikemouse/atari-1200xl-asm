; interrupt.asm
;   Contains interrupt related functionality

;
; eanble interrupts
;   sets up the interrupt chain
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
    mvx #0 SKIP_FRAME

    render_background_music()
    render_sfx #<SFX1, #>SFX1, #<AF1C, #>AF1C
    render_sfx #<SFX2, #>SFX2, #<AF2C, #>AF2C

    exit_level()

    ldx SKIP_FRAME
    cpx #1
    jeq done

	read_game_joystick()
    read_mainmenu_joystick()

	animate_tilesprite()

    render_mainmenu()
    render_intro()
    render_gameover()
    render_player_death()

done
	jmp XITVBV
.endl
