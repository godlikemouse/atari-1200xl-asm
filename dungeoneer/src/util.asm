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
; find tile x right
;   finds the first matching TILEX in right direction using POSY for tile row
.proc find_tilex_r (.byte tiley+1, from_tilex+1, find_tile+1) .var
tiley mva #0 LEVEL_TRANS_VAR0
from_tilex mva #0 LEVEL_TRANS_VAR1
find_tile mva #0 LEVEL_TRANS_VAR2
_tiley=LEVEL_TRANS_VAR0
_from_tilex=LEVEL_TRANS_VAR1
_find_tile=LEVEL_TRANS_VAR2

    mwa #GAME_SCREEN TILEPTR

    ; set initial tile pointer pos to row offset
    ldx #0
    cpx _tiley
    beq scan_limit ; skip offset if tiley zero
    ldx $ff
offset
    adw TILEPTR #40
    inx
    cpx _tiley
    bne offset

scan_limit

    ; set scan limit
    ; scan from tilex position to #40
    lda #40
    sub _from_tilex
    tax

    ldy _from_tilex

loop
    lda (TILEPTR),y
    cmp _find_tile
    bne next

found
    ; reuse variables to perform acc = 40 - x
    mva #40 _from_tilex
    txa
    sta _find_tile
    sbb _from_tilex _find_tile
    lda _from_tilex
    jmp done

next
    iny
    jmp check_limit

check_limit
    dex
    cpx #$ff
    beq not_found
    jmp loop

not_found
    lda #-1

done
    rts
.endp

;
; find tile x left
;   finds the first matching TILEX in left direction using POSY for tile row
.proc find_tilex_l (.byte tiley+1, from_tilex+1, find_tile+1) .var
tiley mva #0 LEVEL_TRANS_VAR0
from_tilex mva #0 LEVEL_TRANS_VAR1
find_tile mva #0 LEVEL_TRANS_VAR2
_tiley=LEVEL_TRANS_VAR0
_from_tilex=LEVEL_TRANS_VAR1
_find_tile=LEVEL_TRANS_VAR2

    mwa #GAME_SCREEN TILEPTR

    ; set initial tile pointer pos to row offset
    ldx #0
    cpx _tiley
    beq scan_limit ; skip offset if tiley zero
    ldx #$ff
offset
    adw TILEPTR #40
    inx
    cpx _tiley
    bne offset

scan_limit

    ldy _from_tilex

loop
    lda (TILEPTR),y
    cmp _find_tile
    bne next

found
    ; reuse variables to perform acc = 40 - x
    tya
    jmp done

next
    dey
    jmp check_limit

check_limit
    cpy #$ff
    beq not_found
    jmp loop

not_found
    lda #-1

done
    rts
.endp
