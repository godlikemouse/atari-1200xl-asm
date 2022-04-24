; util.asm
;   Utility functions and routines

;
; between
;   compares low <= value < high
;   stores temporarily TMP0,TMP6,TMP7,TMP8
;   result stored in acc
.proc between (.byte low+1, value+1, high+1) .var
low mva #0 TMP6
value mva #0 TMP7
high mva #0 TMP8
_low=TMP6
_value=TMP7
_high=TMP8

    ;save stack
    txa
    pha

    lda _value
    ldx _low
    stx TMP0

    ;compare acc to low end
    cmp TMP0
    bcc fail

    ;compare acc to high end
    ldx _high
    stx TMP0
    cmp TMP0
    bcs fail
    lda #1
    sta TMP0
    jmp done

fail
    lda #0
    sta TMP0

done
	;restore stack
	pla
	tax
	lda TMP0
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
tiley mva #0 LEVEL_TRANS_VAR0
find_tile mva #0 LEVEL_TRANS_VAR1
_tiley=LEVEL_TRANS_VAR0
_find_tile=LEVEL_TRANS_VAR1

    mwa #GAME_SCREEN TILEPTR

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
tilex mva #0 LEVEL_TRANS_VAR0
find_tile mva #0 LEVEL_TRANS_VAR1
_tilex=LEVEL_TRANS_VAR0
_find_tile=LEVEL_TRANS_VAR1

    mwa #GAME_SCREEN TILEPTR

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
