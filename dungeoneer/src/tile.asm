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
; display game map
;
.proc display_game_map
level_map=level1_map.map

	ldx #0
	lda #$ff
	sta TILESPRITE
	stx TILESPRITE_INDEX
	mva #1 TILESPRITE_ENABLE

loop
	mva level_map,x SCREEN,x
	mva level_map+40,x SCREEN+40,x
	mva level_map+80,x SCREEN+80,x
	mva level_map+120,x SCREEN+120,x
	mva level_map+160,x SCREEN+160,x
	mva level_map+200,x SCREEN+200,x
	mva level_map+240,x SCREEN+240,x
	mva level_map+280,x SCREEN+280,x
	mva level_map+320,x SCREEN+320,x
	mva level_map+360,x SCREEN+360,x
	mva level_map+400,x SCREEN+400,x
	mva level_map+440,x SCREEN+440,x

	inx
	cpx #40
	bne loop
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
    lda #>SCREEN
    sta TILEPTRH
    lda #<SCREEN
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
; tile is an item
;   if true, acc == 1, else acc == 0
.proc tile_is_item
    tile_is_key()
    ; implied cmp #1
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
; display game over map
;
.proc display_gameover_map
map=gameover.map

	ldx #0
	lda #$ff
	sta TILESPRITE
	stx TILESPRITE_INDEX
	mva #1 TILESPRITE_ENABLE

loop
	mva map,x MENU_SCREEN,x
	mva map+40,x MENU_SCREEN+40,x
	mva map+80,x MENU_SCREEN+80,x
	mva map+120,x MENU_SCREEN+120,x
	mva map+160,x MENU_SCREEN+160,x
	mva map+200,x MENU_SCREEN+200,x
	mva map+240,x MENU_SCREEN+240,x
	mva map+280,x MENU_SCREEN+280,x
	mva map+320,x MENU_SCREEN+320,x
	mva map+360,x MENU_SCREEN+360,x
	mva map+400,x MENU_SCREEN+400,x
	mva map+440,x MENU_SCREEN+440,x

	inx
	cpx #40
	bne loop
	rts
.endp

;
; display main menu map
;
.proc display_mainmenu_map
map=mainmenu.map

	ldx #0
	lda #$ff
	sta TILESPRITE
	stx TILESPRITE_INDEX
	stx TILESPRITE_ENABLE

loop
	mva map,x MENU_SCREEN,x
	mva map+40,x MENU_SCREEN+40,x
	mva map+80,x MENU_SCREEN+80,x
	mva map+120,x MENU_SCREEN+120,x
	mva map+160,x MENU_SCREEN+160,x
	mva map+200,x MENU_SCREEN+200,x
	mva map+240,x MENU_SCREEN+240,x
	mva map+280,x MENU_SCREEN+280,x
	mva map+320,x MENU_SCREEN+320,x
	mva map+360,x MENU_SCREEN+360,x
	mva map+400,x MENU_SCREEN+400,x
	mva map+440,x MENU_SCREEN+440,x

	inx
	cpx #40
	bne loop
	rts
.endp
