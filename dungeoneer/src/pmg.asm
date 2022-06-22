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
dark_brown=$f2

	; character set colors
	mvx #gray COLOR0        ; %01
	mvx #light_gray COLOR1  ; %10
	mvx #brown COLOR2       ; %11
	mvx #green COLOR3       ; %11 (inverse)
	mvx #black COLOR4       ; %00

	; player-missile colors
	mvx #blue PCOLR0
	mvx #dark_brown PCOLR1
	mvx #peach PCOLR2
	rts
.endp

;
; changes tile colors
;
.proc bump_colors
	adb COLOR0 #1
	adb COLOR1 #1
	adb COLOR3 #1
	adb COLOR4 #1
	rts
.endp

;
; clear player pmg
;
.proc clear_player_pmg
pmg_p0 = PMG + $200
pmg_p1 = PMG + $280
pmg_p2 = PMG + $300

	ldx #$80
	lda #0
loop
	dex
	sta pmg_p0,x
	sta pmg_p1,x
	sta pmg_p2,x
	bne loop
	rts
.endp

;
; clear enemy pmg
;
.proc clear_enemy_pmg
missile = PMG + $180

	ldx #$80
	lda #0
loop
	dex
	sta missile,x
	bne loop
	rts
.endp

;
; clear enemy vertical repaint
;
.proc clear_enemy_vertical
missile = PMG + $180

	; clear top and bottom enemy row
	lda ENEMY_POSY
	tay
	dey
	add #8
	tax
	lda #0
	sta missile,x
	sta missile,y
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
.var _limit .byte
pmg_p0 = PMG + $200
pmg_p1 = PMG + $280
pmg_p2 = PMG + $300

	; load animation offset and set limit
	ldx PLAYANIM_OFFSET
	txa
	add #8
	sta _limit

	ldy POSY
loop
	mva player_data,x pmg_p0,y
	mva player_data+8,x pmg_p1,y
	mva player_data+16,x pmg_p2,y
	iny
	inx

	; verify offset limit
	txa
	cmp _limit
	bne loop
	rts
.endp

;
; setup pmg
;
.proc setup_pmg
	mvx #>pmg PMBASE
	mvx #46 SDMCTL ; double line resolution
	mvx #3 GRACTL ; enable PMG
	mvx #1+16 GRPRIOR ; give players priority
	mvx #0 SIZEM
	rts
.endp

;
; animate player right
;
.proc animate_player_right

    jmp check

reset
    mvx #$0 PLAYANIM_OFFSET
    draw_player()

check
    between #$0, PLAYANIM_OFFSET, #$30
    cmp #1
    bne reset

	adb PLAYER_SPRITE #1
	cmp #5
    bne done

    mvx #0 PLAYER_SPRITE
    draw_player()
    adb PLAYANIM_OFFSET #$18
    cmp #$30
    bne done
    mvx #0 PLAYANIM_OFFSET

done
    rts
.endp

;
; animate player left
;
.proc animate_player_left

    jmp check

reset
    mvx #$30 PLAYANIM_OFFSET
    draw_player()

check
    between #$30, PLAYANIM_OFFSET, #$60
    cmp #1
    bne reset

	adb PLAYER_SPRITE #1
	cmp #5
    bne done

    mvx #0 PLAYER_SPRITE
    draw_player()
    adb PLAYANIM_OFFSET #$18
    cmp #$60
    bne done
	mvx #$30 PLAYANIM_OFFSET

done
    rts
.endp

;
; animate player reset
;	resets the player back to the first animation frame
.proc animate_player_reset

	mvx #0 PLAYER_SPRITE
	between #$0, PLAYANIM_OFFSET, #$30
    cmp #1
	bne left
	mvx #$0 PLAYANIM_OFFSET
	jmp draw

left
	mvx #$30 PLAYANIM_OFFSET

draw
	draw_player()

	rts
.endp

;
; display main menu
;	displays the main menu screen
.proc display_mainmenu
	stop_background_music()
	mwx #mainmenu_music BGM_ADDR
	mvx #1 AUDCTL ;N1234HHS
	play_background_music()
	setup_pmg()
	setup_mainmenu_screen()
	setup_menu_tileset()
	display_mainmenu_map()
	mvx #3 GRACTL
	ldx #0
	stx DISPLAY_TYPE
	stx MENU_SELECTION
	stx PLAYANIM_OFFSET
	mvx #-1 PREV_MENU_SELECT
	rts
.endp

;
; how to play
;	displays the how to play screen
.proc display_howtoplay
	stop_background_music()
	setup_pmg()
	setup_menu_screen()
	setup_menu_tileset()
	display_howtoplay_map()
	mvx #3 GRACTL
	mvx #0 DISPLAY_TYPE
	mvx #3 MENU_SELECTION
	mvx #$0 PLAYANIM_OFFSET
	rts
.endp

;
; credits
;	displays the credits screen
.proc display_credits
	stop_background_music()
	setup_pmg()
	setup_menu_screen()
	setup_menu_tileset()
	display_credits_map()
	mvx #3 GRACTL
	mvx #0 DISPLAY_TYPE
	mvx #3 MENU_SELECTION
	mvx #$0 PLAYANIM_OFFSET
	rts
.endp

;
; display game intro
;	displays the game intro screen
.proc display_game_intro
	stop_background_music()
	mvx #$00 AUDCTL
	play_background_music()
	setup_menu_screen()
	setup_menu_tileset()
	display_game_intro_map()
	mvx #1 DISPLAY_TYPE
	mvx #50 INTRO_POSITION
	mvx #$30 POSY
	clear_player_pmg()
	rts
.endp

;
; new game
;	sets up game reset
.proc new_game
	ldx #0
	stx PLAYER_SCORE
	stx PLAYER_SCORE+1
	stx ITEMS
	stx WIN_COUNT
	stx LIFE_GAIN
	mvx #3 PLAYER_LIVES
	mvx #4 ENEMY_SPEED_RES
	level3()
	rts
.endp

;
; display game
; 	displays the game screen
.proc display_game
	stop_background_music()
	mvx #$00 AUDCTL
	mwx #background_music BGM_ADDR
	play_background_music()
	setup_game_screen()
	setup_tileset()
	setup_pmg()
	display_screen_items()
	display_win_count()
	display_player_score()
	display_player_lives()
	enable_tilesprite_animation()
	display_game_map()
	reset_player()
	reset_enemy()
	draw_player()
	store_tilex()
	store_tiley()
	mvx #2 DISPLAY_TYPE
	rts
.endp

;
; display game over
;	displays the game over screen
.proc display_gameover
	setup_colors()
	clear_player_pmg()
	setup_menu_screen()
	setup_menu_tileset()
	enable_tilesprite_animation()
	display_gameover_map()
	stop_background_music()
	play_gameover_sound()
	mvx #3 DISPLAY_TYPE
	rts
.endp

;
; render main menu
;	handles selection / animation of main menu
.proc render_mainmenu
new_game_item=MENU_SCREEN + 160 + 14
how_to_play_item=MENU_SCREEN + 240 + 14
credits_item=MENU_SCREEN + 320 + 14

	ldx DISPLAY_TYPE
	cpx #0
	bne exit

	ldx SCREEN_LOADED
	cpx #1
	bne exit

	restore_menu_item #<new_game_item, #>new_game_item
	restore_menu_item #<how_to_play_item, #>how_to_play_item
	restore_menu_item #<credits_item, #>credits_item

	ldx MENU_SELECTION
	cpx #0
	beq selection_newgame

	cpx #1
	beq selection_howtoplay

	cpx #2
	beq selection_credits

	cpx #3
	beq selection_mainmenu

	jmp done

done
	mvx #90 POSX
	ldx POSX
	stx HPOSP0
	stx HPOSP1
	stx HPOSP2
	stx HPOSP3
	clear_player_pmg()
	draw_player()

exit
	rts

selection_newgame
	highlight_menu_item #<new_game_item, #>new_game_item
	mvx #48 POSY
	jmp done

selection_howtoplay
	highlight_menu_item #<how_to_play_item, #>how_to_play_item
	mvx #64 POSY
	jmp done

selection_credits
	highlight_menu_item #<credits_item, #>credits_item
	mvx #80 POSY
	jmp done

selection_mainmenu
	mvx #104 POSY
	jmp done

.endp

;
; render intro
;
.proc render_intro

	ldx DISPLAY_TYPE
	cpx #1
	bne done

	ldx SCREEN_LOADED
	cpx #1
	bne done

	ldx INTRO_POSITION
	stx POSX
	stx HPOSP0
	stx HPOSP1
	stx HPOSP2
	stx HPOSP3
	inc INTRO_POSITION

	clear_player_pmg()
	draw_player()
	animate_player_right()

	ldx INTRO_POSITION
	cpx #200
	bne done
	mvx #0 INTRO_POSITION

	ldx LEVEL_MAP
	cpx #0
	bne start_game
	bump_colors()
	level1()
	jmp done

start_game
	display_game()

done
	rts
.endp

;
; render gameover
;
.proc render_gameover

	ldx DISPLAY_TYPE
	cpx #3
	bne done

	;ldx SCREEN_LOADED
	;cpx #1
	;bne done

	inc GAMEOVER_POSITION
	ldx GAMEOVER_POSITION
	cpx #255
	bne done

	mvx #0 GAMEOVER_POSITION
	display_mainmenu()

done
	rts
.endp

;
; render player death
;
.proc render_player_death

	ldx PLAYER_DEATH
	cpx #1
	bne done

    jmp check

reset
    mvx #$60 PLAYANIM_OFFSET
    draw_player()

check
    between #$60, PLAYANIM_OFFSET, #$c0
    cmp #1
    bne reset

	adb PLAYER_SPRITE #1
	cmp #30
    bne done

    mvx #0 PLAYER_SPRITE
    draw_player()
    adb PLAYANIM_OFFSET #$18
    cmp #$c0
    bne done

	; complete player death
	check_game_over()
	reset_player()

	mvx #0 PLAYER_DEATH
	mvx #1 RESTORE_COIN

done
    rts
.endp

;
; highlight a menu item
;
.proc highlight_menu_item (.byte addrl+1, addrh+1) .var
addrl mvx #0 TMP0
addrh mvx #0 TMP1

	ldy #0
loop
	lda (TMP0),y
	cmp #128
	bcc less_than
	jmp continue

less_than
	adb (TMP0),y #128

continue
	iny
	cpy #22
	bne loop
	rts
.endp

;
; restore menu item
;
.proc restore_menu_item (.byte addrl+1, addrh+1) .var
addrl mvx #0 TMP0
addrh mvx #0 TMP1

	ldy #0
loop
	lda (TMP0),y
	cmp #128
	bcs greater_than
	jmp continue

greater_than
	sbb (TMP0),y #128

continue
	iny
	cpy #22
	bne loop
	rts
.endp
