; item.asm
;	Game pickup items

;
; display screen items
;	shows picked up items at the top of the screen
.proc display_screen_items

	; key 1
	display_screen_key #1, #$20, $0

	; key 2
	display_screen_key #2, #$22, $2

	; key 2
	display_screen_key #4, #$24, $4

	; key 2
	display_screen_key #8, #$26, $6

	rts
.endp

;
; display player lives
;
.proc display_player_lives
	clear_player_lives()

	ldx #$27
	ldy PLAYER_LIVES
	cpy #0
	beq done
loop
	lda #47
	sta ITEM_SCREEN, x
	sub #1
	dex
	sta ITEM_SCREEN, x
	dex
	dey
	bne loop
done
	rts
.endp

.proc clear_player_lives
	ldx #$27
	ldy #6
	lda #0
loop
	sta ITEM_SCREEN, x
	dex
	sta ITEM_SCREEN, x
	dex
	dey
	bne loop
	rts
.endp

;
; display screen key
; 	displays keys at the top of the screen
;	charset_idx, index of the character to use
;	item_idx, the bit index in ITEMS
;	screen_idx, left to right position in ITEM_SCREEN
.macro display_screen_key item_idx, charset_idx, screen_idx

    lda ITEMS
	and :item_idx
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
dx=TMP2
dy=TMP3
	; bounding box for pickup

	; top left
	poke_position #0, #0
	tile_is_item()
	cmp #1
	beq pickup

	; top right
	poke_position #7, #1
	tile_is_item()
	cmp #1
	beq pickup

	; bottom right
	poke_position #7, #7
	tile_is_item()
	cmp #1
	beq pickup

	; bottom left
	poke_position #0, #7
	tile_is_item()
	cmp #1
	beq pickup
	rts
pickup
	get_item_bit()
	ora ITEMS
	sta ITEMS

    remove_playfield_item()
	display_screen_items()
	play_key_sound()
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

;
; get item bit
;   retrives the item bit mask for an ONTILE item
;   stores bit in acc
.proc get_item_bit

	; stort inital address and bit values
	mva #1 TMP2
	mva #$20 TMP3
	mva #$22 TMP4
	mva #8 TMP5
loop
	; check to see if item exists
	lda ONTILE
	between TMP3, TMP4
	cmp #1
	beq done
	; if not, shift left increase address and continue
	lda TMP2
	asl
	sta TMP2
	adb TMP3 #2
	adb TMP4 #2
	dec TMP5
	bne loop
done
	lda TMP2
	rts
.endp

;
; check player death
;	checks for player death state
.proc check_player_death
	tile_is_death()
	cmp #1
	bne done
	dec PLAYER_LIVES
	check_game_over()
	reset_player()
	display_player_lives()
done
	rts
.endp

;
; check game over
;	checks for game over state
.proc check_game_over
	lda PLAYER_LIVES
	cmp #0
	bne done
	display_game_over()
done
	rts
.endp
