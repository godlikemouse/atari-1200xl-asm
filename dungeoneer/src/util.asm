; util.asm
;   Utility functions and routines

;
; between
;   compares low <= value < high
;   result stored in acc
.proc between (.byte low+1, value+1, high+1) .var
.var _low .byte
.var _value .byte
.var _high .byte
.var _temp .byte
low mva #0 _low
value mva #0 _value
high mva #0 _high

    ;save stack
    txa
    pha

    lda _value
    ldx _low
    stx _temp

    ;compare acc to low end
    cmp _temp
    bcc fail

    ;compare acc to high end
    ldx _high
    stx _temp
    cmp _temp
    bcs fail
    lda #1
    sta _temp
    jmp done

fail
    lda #0
    sta _temp

done
	;restore stack
	pla
	tax
	lda _temp
	rts
.endp

;
; tilex to posx
;   sets acc to absolute TILEX position in pixels
.proc tilex_to_posx
    lda TILEX
    :2 asl ; multiply by 4
    add #TILEX_PIXEL_OFFSET
    rts
.endp

;
; pixel to tilex
;
.proc posx_to_tilex
    lda POSX
    sub #TILEX_PIXEL_OFFSET
    :2 lsr ; divide by 4
    rts
.endp

;
; tiley to posy
;   sets acc to absolute TILEY position in pixels
.proc tiley_to_posy
    lda TILEY
    :3 asl ; multiply by 8
    add #TILEY_PIXEL_OFFSET
    rts
.endp

;
; pixel to tiley
;
.proc posy_to_tiley
    lda POSY
    sub #TILEY_PIXEL_OFFSET
    :3 lsr ; divide by 8
    rts
.endp


;
; find tilex
;   finds the first matching TILEX using POSY for tile row
.proc find_tilex (.byte tiley+1, find_tile+1) .var
.var _tiley .byte
.var _find_tile .byte
tiley mva #0 _tiley
find_tile mva #0 _find_tile

    mwa LEVEL_TRANS_MAP TILEPTR

    lda _tiley
    cmp #0
    beq continue

    ; set initial tile pointer pos to row offset
    ldx $ff
offset
    adw TILEPTR #40
    inx
    cpx _tiley
    bne offset

continue
    ldy #40
loop
    dey
    lda (TILEPTR),y
    cmp _find_tile
    bne verify
    tya
    jmp done

verify
    cpy #0
    bne loop
    lda #-1

done
    rts
.endp

;
; find tilex
;   finds the first matching TILEY using POSX for tile row
.proc find_tiley (.byte tilex+1, find_tile+1) .var
.var _tilex .byte
.var _find_tile .byte
tilex mva #0 _tilex
find_tile mva #0 _find_tile

    mwa LEVEL_TRANS_MAP TILEPTR

    ldy _tilex

    ; set initial tile pointer pos to row offset
    ldx #0
loop
    lda (TILEPTR),y
    cmp _find_tile
    beq found
    adw TILEPTR #40
    inx
    cpx #12
    bne loop

    lda #-1
    jmp done

found
    txa

done
    rts
.endp
