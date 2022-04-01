;
; pickup item
;   determines if collision is with pickup item
.proc pickup_item
    ; center position for pickup
    adb POSX #4
    adb POSY #4
    store_tilex()
    store_tiley()
    ; restore position
    sbb POSX #4
    sbb POSY #4

    ; determine item hit
    store_ontile()

    ; is item a key
    tile_is_key()
    cmp #1
    bne not_key
    sta ITEMS

    ; remove key from playfield
    lda #0
    ldy TILEX
    sta (TILEPTRL), y

    ; remove encountered tile
    lda TILEX
    lsr
    bcc even

    ; determine which direction the other tile is in
    beq even
odd
    ; if odd clear right
    iny
    jmp key_done
even
    ; if even clear left
    dey
key_done
    ; clear other tile
    lda #0
    sta (TILEPTRL), y
not_key

    rts
.endp
