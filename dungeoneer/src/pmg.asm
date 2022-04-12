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

;
; display game over
;	displays the game over screen
.proc display_gameover
	setup_menu_screen()
	setup_menu_tileset()
	display_gameover_map()
	stop_background_music()
	mva #0 GRACTL
	play_gameover_sound()
	mva #2 DISPLAY_TYPE
	rts
.endp

;
; display main menu
;	displays the main menu screen
.proc display_mainmenu
	stop_background_music()
	setup_menu_screen()
	setup_menu_tileset()
	display_mainmenu_map()
	mva #0 DISPLAY_TYPE
	mva #0 MENU_SELECTION
	rts
.endp

;
; display game
; 	displays the game screen
.proc display_game
	setup_game_screen()
	setup_tileset()
	setup_pmg()
	display_screen_items()
	display_player_lives()
	display_game_map()
	clear_pmg()
	draw_player()
	store_tilex()
	store_tiley()
	mva #1 DISPLAY_TYPE
	enable_background_music()
	rts
.endp

;
; draw main menu
;	handles selection / animation of main menu
.proc draw_mainmenu
play_item=MENU_SCREEN + 160 + 16
exit_item=MENU_SCREEN + 240 + 16

	lda DISPLAY_TYPE
	cmp #0
	bne exit

	lda MENU_SELECTION
	cmp #0
	bne select_exit
	highlight_menu_item #<play_item, #>play_item
	restore_menu_item #<exit_item, #>exit_item
	mva #48 POSY
	jmp done

select_exit
	highlight_menu_item #<exit_item, #>exit_item
	restore_menu_item #<play_item, #>play_item
	mva #64 POSY

done
	mva #90 POSX
	ldx POSX
	stx HPOSP0
	stx HPOSP1
	stx HPOSP2
	stx HPOSP3
	clear_pmg()
	draw_player()

exit
	rts
.endp

;
; highlight a menu item
;
.proc highlight_menu_item (.byte addrl+1, addrh+1) .var
addrl mva #0 TMP0
addrh mva #0 TMP1

	ldy #0

loop
	clc
	lda (TMP0),y
	cmp #128
	bcc less_than
	jmp continue

less_than
	adb (TMP0),y #128

continue
	iny
	cpy #8
	bne loop
	rts
.endp

;
; restore menu item
;
.proc restore_menu_item (.byte addrl+1, addrh+1) .var
addrl mva #0 TMP0
addrh mva #0 TMP1

	ldy #0

loop
	clc
	lda (TMP0),y
	cmp #128
	bcs greater_than
	jmp continue

greater_than
	sbb (TMP0),y #128

continue
	iny
	cpy #8
	bne loop
	rts
.endp
