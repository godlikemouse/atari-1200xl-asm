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
low mvx #0 _low
value mvx #0 _value
high mvx #0 _high

    ldx _value

    ;compare value to low end
    cpx _low
    bcc fail

    ;compare value to high end
    cpx _high
    bcs fail
    lda #1
    jmp done

fail
    lda #0

done
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
tiley mvx #0 _tiley
find_tile mvx #0 _find_tile

    mwx #GAME_SCREEN TILEPTR

    ldx _tiley
    cpx #0
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
tilex mvx #0 _tilex
find_tile mvx #0 _find_tile

    mwx #GAME_SCREEN TILEPTR

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

;
; tile to tileptr
;   updates TILEPTR to the coordinates of args tilex, tiley
.proc tile_to_tileptr (.byte tilex+1, tiley+1) .var
.var _tilex .byte
.var _tiley .byte
tilex mva #0 _tilex
tiley mva #0 _tiley

    mwa #GAME_SCREEN TILEPTR

    ; advance to row
    ldx _tiley
    cpx #0
    beq continue

row_loop
    adw TILEPTR #40
    dex
    bne row_loop

continue

    ;advance to column
    ldx _tilex
    cpx #0
    beq done

column_loop
    adw TILEPTR #1
    dex
    bne column_loop

done
    rts
.endp

;
; initialize zeropage
;   resets zeropage
.proc initialize_zeropage
    lda #0
    tax
loop
    sta $c0,x
    sta $100,x
    inx
    cpx #$40
    bne loop
    rts
.endp
