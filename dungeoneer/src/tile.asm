; tile.asm
;   Map tile and related functionality

;
; setup tileset
;
.proc setup_tileset
	mva #>GAME_TILESET1 TILESET_ADDRESS
	mva TILESET_ADDRESS CHBAS
	rts
.endp

;
; setup menu tileset
;
.proc setup_menu_tileset
	mva #>MENU_TILESET1 TILESET_ADDRESS
	mva TILESET_ADDRESS CHBAS
	rts
.endp

;
; animate tilesprite
; 	animate map tile sprites
.proc animate_tilesprite
	inc TILESPRITE
	ldx TILESPRITE
	ldy TILESPRITE_INDEX

	lda TILESPRITE_ENABLE
	cmp #1
	bne done

	cpx #10
	bne done
	ldx #$ff
	stx TILESPRITE

	iny
	sty TILESPRITE_INDEX

	adb CHBAS #4
	cpy #3
	beq reset

	sta CHBAS
	jmp done

reset
	mva TILESET_ADDRESS CHBAS
	mva #0 TILESPRITE_INDEX

done
	rts
.endp

;
; store on tile
;
.proc store_ontile
    ; calculate screen tile offset
    lda #>GAME_SCREEN
    sta TILEPTRH
    lda #<GAME_SCREEN
    sta TILEPTRL

    ldy TILEY
    cpy #0
    beq done

lookup_loop
    adc #40
    sta TILEPTRL
    bcs carry_tileptrh

cont
    dey
    bne lookup_loop
    ldy TILEX

done
    lda (TILEPTRL),y
    sta ONTILE
    rts

carry_tileptrh
    adb TILEPTRH #1
    lda TILEPTRL
    jmp cont
.endp

;
; store tile x
;
.proc store_tilex
	lda POSX
	sec
	sbc #52
	lsr
	lsr
	sta TILEX
	rts
.endp

;
; store tile y
;
.proc store_tiley
	lda POSY
	sec
	sbc #24
	lsr
	lsr
	lsr
	sta TILEY
	rts
.endp

;
; tile is block
;   if true, acc == 1, else acc == 0
.proc tile_is_block
    lda ONTILE
    between #$10, #$12
    rts
.endp

;
; tile is key
;  if true, acc == 1, else acc == 0
.proc tile_is_key
    lda ONTILE
    between #$20, #$28
    rts
.endp

;
; tile is chest
;	if true, acc == 1, else acc == 0
.proc tile_is_chest
	lda ONTILE
	between #$28, #$2a
	rts
.endp

;
; tile is coin
;	if true, acc == 1, else acc == 0
.proc tile_is_coin
	lda ONTILE
	between #$2a, #$2c
	rts
.endp

;
; tile is an item
;   if true, acc == 1, else acc == 0
.proc tile_is_item
    tile_is_key()
	cmp #1
	bne not_key
	lda #1
	play_key_sound()
	jmp done

not_key
	tile_is_chest()
	cmp #1
	bne not_chest
	add_score #$20, #$00
	lda #1
	play_chest_sound()
	jmp done

not_chest
	tile_is_coin()
	cmp #1
	bne done
	add_score #$05, #$00
	lda #1
	play_coin_sound()
	jmp done

done
    rts
.endp

;
; tile is death
;	if true, acc == 1, else acc == 0
.proc tile_is_death
	lda ONTILE
	between #62, #64
	rts
.endp

;
; poke position
;	temporarily advances POSX, POSY and stores TILEX, TILEY and ONTILE
;	uses TMP2 (x), TMP3 (y)
.proc poke_position (.byte dx+1, dy+1) .var
dx mva #0 TMP2
dy mva #0 TMP3

	adb POSX TMP2
	adb POSY TMP3
	store_tilex()
	store_tiley()
	store_ontile()
	sbb POSX TMP2
	sbb POSY TMP3
	rts
.endp

;
; display main menu map
;
.proc display_mainmenu_map
map=mainmenu.map
	enable_tilesprite_animation()
	render_map #<map, #>map, #<MENU_SCREEN, #>MENU_SCREEN
	rts
.endp

;
; display game intro map
;
.proc display_game_intro_map
map=level1_map.intro
	render_map #<map, #>map, #<MENU_SCREEN, #>MENU_SCREEN
	rts
.endp

;
; display game map
;
.proc display_game_map
map=level1_map.map
	render_map #<map, #>map, #<GAME_SCREEN, #>GAME_SCREEN
	rts
.endp

;
; display game over map
;
.proc display_gameover_map
map=gameover.map
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
; enable tile sprite animation
;
.proc enable_tilesprite_animation
	mva #$ff TILESPRITE
	mva #0 TILESPRITE_INDEX
	mva #1 TILESPRITE_ENABLE
	rts
.endp

;
; disable tile sprite animation
;
.proc disable_tilesprite_animation
	mva #0 TILESPRITE_ENABLE
	rts
.endp
