; tile.asm
;   Map tile and related functionality

TILEX_PIXEL_OFFSET=48 ; left overscan in pixels
TILEY_PIXEL_OFFSET=24 ; top overscan in pixels + items screen in pixels

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

	mwa #GAME_SCREEN TILEPTR

	; calculate screen tile offset
	lda TILEY
	cmp #0
	beq continue

	ldx #0
offset
	adw TILEPTR #40
	inx
	cpx TILEY
	bne offset

continue
	ldy TILEX
	lda (TILEPTR),y
	sta ONTILE
	rts
.endp

;
; store tile x
;
.proc store_tilex
	lda POSX
	sec
	sbc #TILEX_PIXEL_OFFSET
	:2 lsr ; divide by 4
	sta TILEX
	rts
.endp

;
; store tile y
;
.proc store_tiley
	lda POSY
	sub #TILEY_PIXEL_OFFSET
	:3 lsr ; divide by 8
	sta TILEY
	rts
.endp

;
; tile is block
;   if true, acc == 1, else acc == 0
.proc tile_is_block
    between #$10, ONTILE, #$14
	cmp #1
	beq done

	; 90 - 94
	between #$10+128, ONTILE #$14+128
done
    rts
.endp

;
; tile is key
;  if true, acc == 1, else acc == 0
.proc tile_is_key
    between #$20, ONTILE #$28
    rts
.endp

;
; tile is chest
;	if true, acc == 1, else acc == 0
.proc tile_is_chest
	between #$28, ONTILE, #$2a
	rts
.endp

;
; tile is coin
;	if true, acc == 1, else acc == 0
.proc tile_is_coin
	between #$2a, ONTILE, #$2c
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
	between #$3e, ONTILE, #$40
	rts
.endp

;
; tile is proxy
;
.proc tile_is_proxy
	between #$34, ONTILE, #$36
	rts
.endp

;
; tile is transition north
;
.proc tile_is_transition_n
	lda ONTILE
	cmp #$5c
	bne done
	lda #1

done
	rts
.endp

;
; tile is transition east
;
.proc tile_is_transition_e
	lda ONTILE
	cmp #$5e
	bne done
	lda #1

done
	rts
.endp

;
; tile is transition south
;
.proc tile_is_transition_s
	lda ONTILE
	cmp #$5d
	bne done
	lda #1

done
	rts
.endp

;
; tile is transition west
;
.proc tile_is_transition_w
	lda ONTILE
	cmp #$5f
	bne done
	lda #1

done
	rts
.endp

;
; tile is locked door
;	if true, acc == 1, else acc == 0
.proc tile_is_locked_door
	between #$40, ONTILE, #$44
	rts
.endp

;
; tile is exit
;
.proc tile_is_exit
	between #$50, ONTILE, #$52
	rts
.endp

;
; tile is locked proxy
;
.proc tile_is_locked_proxy
	tile_is_proxy()
	cmp #1
	bne done

	; tile is proxy, check lock

	; find locked door, tilex/tiley
	find_locked_door()
	cmp #1
	bne done

	; do we have a key
	has_key #%00000001
	cmp #0
	beq locked

	; unlock door
	unlock_door()

	jmp done

locked
	lda #1
	rts

done
	lda #0
	rts
.endp

;
; unlock door
;
.proc unlock_door

	; replace closed door with open door tile

	ldy TILEX
loop
	lda (TILEPTR), y-
	cmp #64
	bne loop
	iny

	lda #68
	sta (TILEPTR), y+
	add #1
	sta (TILEPTR), y+
	add #1
	sta (TILEPTR), y+
	add #1
	sta (TILEPTR), y+

	play_door_open_sound()

	rts
.endp

;
; find locked door
;	updates tilex, tiley with location
;	if found acc == 1, else acc == 0
.proc find_locked_door

	; look south
	inc TILEY
	store_ontile()
	tile_is_locked_door()
	cmp #1
	beq done
	dec TILEY
	store_ontile()

	; look west
	dec TILEX
	store_ontile()
	tile_is_locked_door()
	cmp #1
	beq done
	inc TILEX
	store_ontile()

	; look north
	dec TILEY
	store_ontile()
	tile_is_locked_door()
	cmp #1
	beq done
	inc TILEY
	store_ontile()

	; look east
	inc TILEX
	store_ontile()
	tile_is_locked_door()
	cmp #1
	beq done
	dec TILEX
	store_ontile()

done
	rts
.endp

;
; peek position
;	temporarily advances POSX, POSY and stores TILEX, TILEY and ONTILE
;	uses TMP2 (x), TMP3 (y)
.proc peek_position (.byte dx+1, dy+1) .var
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
