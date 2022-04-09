; pmg.asm
;	Player Missile Graphics (PMG) specific routines

;
; setup colors
;
.proc setup_colors
black=$00
gray=$06
light_gray=$0a
green=$c4
brown=$24
peach=$3c
blue=$80

	; character set colors
	mva #gray COLOR0        ; %01
	mva #light_gray COLOR1  ; %10
	mva #brown COLOR2       ; %11
	mva #green COLOR3       ; %11 (inverse)
	mva #black COLOR4       ; %00

	; player-missile colors
	mva #blue PCOLR0
	mva #brown PCOLR1
	mva #peach PCOLR2
	rts
.endp

;
; clear pmg
;
.proc clear_pmg
pmg_p0 = PMG + $200
pmg_p1 = PMG + $280
pmg_p2 = PMG + $300

	ldx #$80
	lda #0

loop
	sta pmg_p0,x
	sta pmg_p1,x
	sta pmg_p2,x
	dex
	bne loop
	rts
.endp

;
; clear player vertical repaint
;
.proc clear_player_vertical
pmg_p0 = PMG + $200
pmg_p1 = PMG + $280
pmg_p2 = PMG + $300

	; clear top and bottom player row
	lda POSY
	tay
	dey
	add #8
	tax
	lda #0
	sta pmg_p0,x
	sta pmg_p1,x
	sta pmg_p2,x
	sta pmg_p0,y
	sta pmg_p1,y
	sta pmg_p2,y
	rts
.endp

;
; draw player
;
.proc draw_player
pmg_p0 = PMG + $200
pmg_p1 = PMG + $280
pmg_p2 = PMG + $300

	; load animation offset and set limit
	ldx PLAYANIM_OFFSET
	txa
	add #8
	sta TMP6

	ldy POSY

loop
	mva player_data,x pmg_p0,y
	mva player_data+8,x pmg_p1,y
	mva player_data+16,x pmg_p2,y
	iny
	inx

	; verify offset limit
	txa
	cmp TMP6
	bne loop
	rts
.endp

;
; setup pmg
;
.proc setup_pmg
	mva #>pmg PMBASE
	mva #46 SDMCTL ; single line resolution
	mva #3 GRACTL ; enable PMG
	mva #1 GRPRIOR ; give players priority
	reset_player()
	rts
.endp

;
; animate player right
;
.proc animate_player_right

    jmp check

reset
    mva #$0 PLAYANIM_OFFSET
    draw_player()

check
    lda PLAYANIM_OFFSET
    between #$0, #$30
    cmp #1
    bne reset

    ldx PLAYER_SPRITE
    inx
    stx PLAYER_SPRITE
    cpx #5
    bne done

    mva #0 PLAYER_SPRITE
    draw_player()
    adb PLAYANIM_OFFSET #$18
    cmp #$30
    bne done

    mva #0 PLAYANIM_OFFSET
done
    rts
.endp

;
; animate player left
;
.proc animate_player_left

    jmp check

reset
    mva #$60 PLAYANIM_OFFSET
    draw_player()

check
    lda PLAYANIM_OFFSET
    between #$60, #$90
    cmp #1
    bne reset

timer
    ldx PLAYER_SPRITE
    inx
    stx PLAYER_SPRITE
    cpx #5
    bne done

    mva #0 PLAYER_SPRITE
    draw_player()
    adb PLAYANIM_OFFSET #$18
    cmp #$90
    bne done

    mva #$60 PLAYANIM_OFFSET
done
    rts
.endp

;
; animate player reset
;	resets the player back to the first animation frame
.proc animate_player_reset
	mva #0 PLAYER_SPRITE
	lda PLAYANIM_OFFSET
	between #$0, #$30
    cmp #1
	bne left
	mva #$0 PLAYANIM_OFFSET
	jmp draw
left
	mva #$60 PLAYANIM_OFFSET
draw
	draw_player()
	rts
.endp

.proc display_game_over
	setup_game_over()
	rts
.endp
