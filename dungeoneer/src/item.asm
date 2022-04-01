;
; display screen items
;	shows picked up items at the top of the screen
.proc display_screen_items

	; key 0
	display_screen_key $1, #192, $0

	rts
.endp

;
; display screen key
; 	displays keys at the top of the screen
;	charset_idx, index of the character to use
;	screen_idx, left to right position in ITEM_SCREEN
;	item_idx, the bit index in ITEMS
.macro display_screen_key item_idx, charset_idx, screen_idx
    lda ITEMS
	and
    cmp :item_idx
	bne done

    ldx :charset_idx
	stx ITEM_SCREEN + :screen_idx
	inx
	stx ITEM_SCREEN + :screen_idx + 1
done
.endm

;
; pickup item
;   determines if collision is with a pickup item
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

    remove_playfield_item()
	display_screen_items()
not_key

    rts
.endp

;
; remove playfield item
;
.proc remove_playfield_item
    ; clear encountered tile
    lda #0
    ldy TILEX
    sta (TILEPTRL), y

    ; remove ajoining tile
    lda TILEX
    lsr
    bcc even

    ; determine which direction the other tile is in
    beq even

    ; if odd clear right
    iny
    jmp done
even
    ; if even clear left
    dey
done
    ; clear other tile
    lda #0
    sta (TILEPTRL), y
    rts
.endp
