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
    mwx #vvblkd_chain VVBLKD
    rts

.endp

;
; vvblkd chain
;	method chains for VVBLKD interupts
.local vvblkd_chain
    ; save stack
    pha
    txa
    pha
    tya
    pha

    mvx #0 SKIP_FRAME

    render_background_music()
    render_sfx #<SFX1, #>SFX1, #<AF1C, #>AF1C
    render_sfx #<SFX2, #>SFX2, #<AF2C, #>AF2C

    sequence_handler()

    ldx SKIP_FRAME
    cpx #1
    jeq done

    exit_level()

    ldx SKIP_FRAME
    cpx #1
    jeq done

    transition_map()

    ldx SKIP_FRAME
    cpx #1
    jeq done

    restore_key_state()

    ldx SKIP_FRAME
    cpx #1
    jeq done

    restore_coin_state()

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
    ; restore stack
    pla
    tay
    pla
    tax
    pla

	jmp XITVBV
.endl
