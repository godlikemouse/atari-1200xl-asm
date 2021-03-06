; interrupt.asm
;   Contains interrupt related functionality

;
; enable interrupts
;   sets up the interrupt chain
.proc enable_interrupts
    ; enable interrupt
    ldy #<vvblkd_interrupt
    ldx #>vvblkd_interrupt
    lda #7
    jsr SETVBV

    ;setup VVBLKD interrupt chain
vvblkd_interrupt
    mwx #vvblkd_init VVBLKD
    rts
.endp

;
; vvblkd init
;   first vblank initialization
.local vvblkd_init
    ; save stack
    pha
    txa
    pha

    mvx #1 VBLANK_LOADED
    mwx #vvblkd_chain VVBLKD

    pla
    tax
    pla

    jmp XITVBV
.endl

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

    ldx SCREEN_LOADED
    cpx #1
    bne done

    ldx VBLANK_SKIP
    cpx #1
    beq done

    mvx #0 SKIP_FRAME

    exit_level()

    ldx SKIP_FRAME
    cpx #1
    beq done

	read_game_joystick()
    read_mainmenu_joystick()

	animate_tilesprite()

    render_mainmenu()
    render_intro()
    render_gameover()
    render_player_death()
    render_enemy()
done
    ; restore stack
    pla
    tay
    pla
    tax
    pla

	jmp XITVBV
.endl
