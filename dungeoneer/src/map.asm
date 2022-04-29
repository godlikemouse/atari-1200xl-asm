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
	mva #4 GRPRIOR
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
; reload map
;
.proc reload_map
	render_map LEVEL_MAP, LEVEL_MAP+1, #<GAME_SCREEN, #>GAME_SCREEN
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
mapl mvx #0 TMP0
maph mvx #0 TMP1
screenl mvx #0 TMP2
screenh mvx #0 TMP3

map=TMP0
screen=TMP2
map2=TMP4
screen2=TMP6

	; setup 240 byte offset src/dest
	mwx map map2
	mwx screen screen2
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
mapl mvx #0 TMP0
maph mvx #0 TMP1
attr=TMP0

	adw attr #480 ; start at end of visual map data

	ldy #0
loop
	lda (attr),y+

	; check for done
	cmp #0
	bne load_player_position
	jmp done

load_player_position
	cmp #1
	bne load_next_level

	lda LEVEL_TRANS_MAP
	cmp #0
	bne transition_attributes

	mva (attr),y+ PLAYER_RESET_POSX
	mva (attr),y+ PLAYER_RESET_POSY
	jmp loop

transition_attributes
	:2 iny
	jmp loop

load_next_level
	cmp #2
	bne load_north_transition
	mva (attr),y+ NEXT_LEVEL
	mva (attr),y+ NEXT_LEVEL+1
	jmp loop

load_north_transition
	cmp #3
	bne load_east_transition
	mva (attr),y+ LEVEL_TRANS_N
	mva (attr),y+ LEVEL_TRANS_N+1
	jmp loop

load_east_transition
	cmp #4
	bne load_south_transition
	mva (attr),y+ LEVEL_TRANS_E
	mva (attr),y+ LEVEL_TRANS_E+1
	jmp loop

load_south_transition
	cmp #5
	bne load_west_transition
	mva (attr),y+ LEVEL_TRANS_S
	mva (attr),y+ LEVEL_TRANS_S+1
	jmp loop

load_west_transition
	cmp #6
	bne load_coin_state
	mva (attr),y+ LEVEL_TRANS_W
	mva (attr),y+ LEVEL_TRANS_W+1
	jmp loop

load_coin_state
	cmp #7
	bne done
	lda (attr),y+ ; count
coin_loop
	iny ; skip bytes by count
	sub #1
	bne coin_loop
	jmp loop

done
	rts
.endp

;
; update coin state
;
.proc update_coin_state (.byte tilex+1, tiley+1) .var
.var _tilex .byte
.var _tiley .byte
tilex mvx #0 _tilex
tiley mvx #0 _tiley

	mvx #0 $11c

	; find level in memory location
	ldy #0
	mwx LEVEL_MAP TMP0

	; store only left most tilex position of item
	lda ONTILE
	and #1
	cmp #1 ; odd
	bne even
	sbb _tilex #1

even
	adw TMP0 #480 ; offset to coin state location
	lda (TMP0),y
	cmp #7 ; validate
	bne done

	iny ; move to count

	iny ; move to first coin state slot
loop
	; find first available slot
	lda (TMP0),y+ ; tilex
	cmp #$ff
	bne loop

	; store coin state
	dey
	mva _tilex (TMP0),y+
	mva _tiley (TMP0),y

done
    rts
.endp
