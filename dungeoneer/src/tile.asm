; tile.asm
;   Map tile and related functionality

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
