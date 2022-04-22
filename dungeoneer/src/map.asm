; map.asm
;	handles map functionality

;
; display main menu map
;
.proc display_mainmenu_map
	enable_tilesprite_animation()
	render_map #<mainmenu.map, #>mainmenu.map, #<MENU_SCREEN, #>MENU_SCREEN
	rts
.endp

;
; display game intro map
;
.proc display_game_intro_map
	render_map LEVEL_INTRO, LEVEL_INTRO+1, #<MENU_SCREEN, #>MENU_SCREEN
	rts
.endp

;
; display game map
;
.proc display_game_map
	render_map LEVEL_MAP, LEVEL_MAP+1, #<GAME_SCREEN, #>GAME_SCREEN
	load_map_attributes LEVEL_MAP, LEVEL_MAP+1
	rts
.endp

;
; display game over map
;
.proc display_gameover_map
	render_map #<gameover.map, #>gameover.map, #<MENU_SCREEN, #>MENU_SCREEN
	rts
.endp

;
; render map
;	renders map data to destination screen
.proc render_map(.byte mapl+1, maph+1, screenl+1, screenh+1) .var
mapl mva #0 TMP0
maph mva #0 TMP1
screenl mva #0 TMP2
screenh mva #0 TMP3

map=TMP0
screen=TMP2
map2=TMP4
screen2=TMP6

	; setup 240 byte offset src/dest
	mwa map map2
	mwa screen screen2
	adw map2 #240
	adw screen2 #240

	ldy #0
loop
	mva (map),y (screen),y
	mva (map2),y (screen2),y
	iny
	cpy #240
	bne loop
	rts
.endp

;
; load map attributes
;
.proc load_map_attributes (.byte mapl+1, maph+1) .var
mapl mva #0 TMP0
maph mva #0 TMP1
attr=TMP0

	adw attr #480 ; start at end of visual map data

	ldy #0
loop
	lda (attr),y+

	; check for done
	cmp #0
	bne player_position
	jmp done

player_position
	cmp #1
	bne next_level
	mva (attr),y+ PLAYER_RESET_POSX
	mva (attr),y+ PLAYER_RESET_POSY
	jmp loop

next_level
	cmp #2
	bne done
	mwa (attr),y+ NEXT_LEVEL
	iny
	jmp loop

done
	rts
.endp
