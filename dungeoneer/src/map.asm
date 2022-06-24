; map.asm
;	handles map functionality

;
; display main menu map
;
.proc display_mainmenu_map
	enable_tilesprite_animation()
	mvx #0 SCREEN_LOADED
	render_map #<mainmenu.map, #>mainmenu.map, #<MENU_SCREEN, #>MENU_SCREEN
	mvx #1 SCREEN_LOADED
	rts
.endp

;
; display how to play map
;
.proc display_howtoplay_map
	enable_tilesprite_animation()
	mvx #0 SCREEN_LOADED
	render_map #<howtoplay.map, #>howtoplay.map, #<MENU_SCREEN, #>MENU_SCREEN
	mvx #1 SCREEN_LOADED
	rts
.endp

;
; display credits map
;
.proc display_credits_map
	enable_tilesprite_animation()
	mvx #0 SCREEN_LOADED
	render_map #<credits.map, #>credits.map, #<MENU_SCREEN, #>MENU_SCREEN
	mvx #1 SCREEN_LOADED
	rts
.endp

;
; display game intro map
;
.proc display_game_intro_map
	mva #4+16 GRPRIOR
	mvx #0 SCREEN_LOADED
	render_map LEVEL_INTRO, LEVEL_INTRO+1, #<MENU_SCREEN, #>MENU_SCREEN
	mvx #1 SCREEN_LOADED
	rts
.endp

;
; display game map
;
.proc display_game_map
	mvx #0 SCREEN_LOADED
	render_map LEVEL_MAP, LEVEL_MAP+1, #<GAME_SCREEN, #>GAME_SCREEN
	load_map_attributes LEVEL_ATTRS, LEVEL_ATTRS+1
	mvx #1 SCREEN_LOADED
	rts
.endp

;
; display game over map
;
.proc display_gameover_map
	mvx #0 SCREEN_LOADED
	render_map #<gameover.map, #>gameover.map, #<MENU_SCREEN, #>MENU_SCREEN
	mvx #1 SCREEN_LOADED
	rts
.endp

;
; render map
; 	renders map data to destination screen using rle if available
.proc render_map(.byte mapl+1, maph+1, screenl+1, screenh+1) .var
.var _count .word
.var _b1 .byte
.var _b2 .byte
mapl mvx #0 TMP0
maph mvx #0 TMP1
screenl mvx #0 TMP2
screenh mvx #0 TMP3

map=TMP0
screen=TMP2

	mwx #0 _count
	ldy #0
loop
	; read a byte
	lda (map),y

check_rle
	decode_rle()
	cpx #1
	bne check_rle_2
	jmp continue

check_rle_2
	decode_rle_2()
	cpx #1
	bne standard
	jmp continue

standard
	; non-rle
	sta (screen),y
    adw _count #1

    ; increment map/screen pointers
	adw map #1
	adw screen #1

continue
	; check limit
	cpw _count #480
	bne loop

	rts

;
; decode rle 1 byte
;	uses acc as type byte
.proc decode_rle

	jmp check

invalid
	ldx #0
	rts

check
	; single byte rle
	cmp #$ff
	bne invalid

	; second byte contains rle length
	adw map #1
	lda (map),y
	tax

	; third byte contains value
	adw map #1
	lda (map),y

	; perform rle decode and copy
    dex
loop
	sta (screen),y
    tay
	adw screen #1
	adw _count #1
    tya
    ldy #0
	dex
	bne loop
    ldx #1
	rts
.endp

;
; decode rle 2 byte
;	uses x as rle length
.proc decode_rle_2

	jmp check

invalid
	ldx #0
	rts

check
	; double byte rle
	cmp #$fe
	bne invalid

	; second byte contains rle length
	adw map #1
	lda (map),y
	tax

	; third byte contains value 1
	adw map #1
	lda (map),y
	sta _b1

	; forth byte contains value 2
	adw map #1
	lda (map),y
	sta _b2

	; perform rel 2 byte decode and copy
loop
	mva _b1 (screen),y+
	mva _b2 (screen),y
	ldy #0
	adw screen #2
	adw _count #2
	dex
	bne loop
    adw map #1
	ldx #1
	rts
.endp

.endp

;
; load map attributes
;
.proc load_map_attributes (.byte attrl+1, attrh+1) .var
attrl mvx #0 TMP0
attrh mvx #0 TMP1
attr=TMP0

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
	bne load_key_position
	lda (attr),y+ ; count
coin_loop
	iny ; skip bytes by count
	sub #1
	bne coin_loop
	jmp loop

load_key_position
	cmp #8
	bne load_enemy_position
	mva (attr),y+ KEY_POSX
	mva (attr),y+ KEY_POSY
	jmp loop

load_enemy_position
	cmp #9
	bne done
	mva (attr),y+ ENEMY_POSX
	mva (attr),y+ ENEMY_POSY
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

	; find level in memory location
	ldy #0
	mwx LEVEL_ATTRS TMP0

	; store only left most tilex position of item
	lda ONTILE
	and #1
	cmp #1 ; odd
	bne even
	sbb _tilex #1

even
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
