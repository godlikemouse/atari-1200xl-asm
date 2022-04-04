; tile.asm
;   Map tile and related functionality

;
; store on tile
;
.proc store_ontile
    ; store stack
    pha
    tya
    pha

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

    ; restore stack
    pla
    tay
    pla

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
