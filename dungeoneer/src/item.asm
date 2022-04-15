; item.asm
;	Game pickup items

;
; display screen items
;	shows picked up items at the top of the screen
.proc display_screen_items

	; key 1
	display_screen_key #1, #$20, #$0

	; key 2
	display_screen_key #2, #$22, #$2

	; key 3
	display_screen_key #4, #$24, #$4

	; key 4
	display_screen_key #8, #$26, #$6
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
	sta ITEM_SCREEN, x-
	sub #1
	sta ITEM_SCREEN, x-
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
	sta ITEM_SCREEN, x-
	sta ITEM_SCREEN, x-
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
.proc display_screen_key (.byte item_idx+1, charset_idx+1, screen_idx+1) .var
item_idx mva #0 TMP0
charset_idx mva #0 TMP1
screen_idx mva #0 TMP2

item_index=TMP0
charset_index=TMP1
screen_index=TMP2

	lda ITEMS
	and item_index
	cmp item_index
	bne done

	lda charset_index
	ldy screen_index
	sta ITEM_SCREEN,y+
	add #1
	sta ITEM_SCREEN,y

done
	rts
.endp

;
; display player score
;
.proc display_player_score

	; display on screen
	ldy #20
	ldx #4

loop

	; NXXX
	lda #0
	add #96
	sta ITEM_SCREEN,y
	add #1
	iny
	sta ITEM_SCREEN,y
	iny
	dex
	bne loop

	rts
.endp

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
	check_player_death()

	; top right
	poke_position #7, #1
	tile_is_item()
	cmp #1
	beq pickup
	check_player_death()

	; bottom right
	poke_position #7, #7
	tile_is_item()
	cmp #1
	beq pickup
	check_player_death()

	; bottom left
	poke_position #0, #7
	tile_is_item()
	cmp #1
	beq pickup
	check_player_death()

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
	mwa #death_sfx SFX1_ADDRL
	mva #1 SFX1

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
	display_gameover()
done
	rts
.endp
