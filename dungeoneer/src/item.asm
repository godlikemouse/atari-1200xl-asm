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

	ldy #27

	; score is kept in 4 byte (nibble) per memory location

	; XXXN
	; get lower nibble
	lda PLAYER_SCOREL
	and #$0f
	display_number()

	; XXNX
	; get upper nibble
	lda PLAYER_SCOREL
	and #$f0
	lsr
	lsr
	lsr
	lsr
	display_number()

	; XNXX
	; get lower nibble
	lda PLAYER_SCOREH
	and #$0f
	display_number()

	; NXXX
	; get upper nibble
	lda PLAYER_SCOREH
	and #$f0
	lsr
	lsr
	lsr
	lsr
	display_number()
	rts

.proc display_number
	asl ; multiply by 2
	add #97 ; add display number offset
	sta ITEM_SCREEN,y-
	sub #1
	sta ITEM_SCREEN,y-
	rts
.endp

.endp

;
; add to player score
;	score is stored in nibbles (ie. 50 hbyte: 00, lbyte: 50)
.proc add_score (.byte hbyte+1, lbyte+1) .var
hbyte mva #0 TMP0
lbyte mva #0 TMP1
HIGH=TMP0
LOW=TMP1

	; store lower nibble of LOW (XXXN)
	lda LOW
	and #$0f
	sta TMP2

    ; load score lower nibble (XXXN)
	lda PLAYER_SCOREL
	and #$0f

    ; add to score nibble (XXXN)
	add TMP2

    ; check for overflow (XXXN)
	cmp #10
    bcc lb_no_carry
    jmp lb_carry

lb_no_carry
    ; no carry, just store and move on (XXXN)
    sta TMP2
    mva #0 TMP3 ; no overflow
    jmp lb_continue

lb_carry
    ; sub 10, then set the carry into next nibble (XXON)
	sub #10
	sta TMP2
	mva #1 TMP3 ; overflow
    jmp lb_continue

lb_continue
    ; done with (XXXN), store in player score
    lda PLAYER_SCOREL
    and #$f0
    ora TMP2
    sta PLAYER_SCOREL

    ; store higher nibble of score (XXNX)
    and #$f0
    lsr
    lsr
    lsr
    lsr
    sta TMP2

    ; check high nibble of LOW for overflow (XONX)
    lda LOW
    and #$f0
    lsr
    lsr
    lsr
    lsr
    add TMP3 ; overflow
    add TMP2
    cmp #10
    bcc lbh_no_carry
    jmp lbh_carry

lbh_no_carry
    ; no carry, just store and move on (XXNX)
    sta TMP2
    mva #0 TMP3 ; no overflow
    jmp lbh_continue

lbh_carry
    ; sub 10, then set the carry into the next nibble (XONX)
    sub #10
    sta TMP2
    mva #1 TMP3 ; overflow
    jmp lbh_continue

lbh_continue
    ; done with lower byte HIGH, store (XXNN)
    lda PLAYER_SCOREL
    and #$0f
    sta TMP4
    lda TMP2
    asl
    asl
    asl
    asl
    ora TMP4
    sta PLAYER_SCOREL

    ; moving on to high byte

    ; store lower nibble of HIGH (XNXX)
    lda HIGH
    and #$0f
    sta TMP2

    ; load score lower nibble (XNXX)
	lda PLAYER_SCOREH
	and #$0f

    ; add score nibble (XNXX)
	add TMP2
    add TMP3 ; overflow

    ; check for overflow (XNXX)
	cmp #10
    bcc hb_no_carry
    jmp hb_carry

hb_no_carry
    ; no carry, just store and move on (XNXX)
    sta TMP2
    mva #0 TMP3 ; no overflow
    jmp hb_continue

hb_carry
    ; sub 10, then set the carry into next nibble (ONXX)
    sub #10
    sta TMP2
    mva #1 TMP3 ; overflow
    jmp hb_continue

hb_continue
    ; done with high byte lower nibble (XNXX)
    lda PLAYER_SCOREH
    and #$f0
    ora TMP2
    sta PLAYER_SCOREH

    ; load high byte nibble (NXXX)
    lda HIGH
    and $f0
    lsr
    lsr
    lsr
    lsr
    sta TMP2

    ; load score high nibble (NXXX)
    lda PLAYER_SCOREH
    and #$f0
    lsr
    lsr
    lsr
    lsr
    add TMP3 ; overflow
    add TMP2
    sta TMP2

    ; last nibble, no more overflow checking (NXXX)

    ; done with higher byte (NNXX)
    lda PLAYER_SCOREH
    and #$0f
    sta TMP4
    lda TMP2
    asl
    asl
    asl
    asl
    ora TMP4
    sta PLAYER_SCOREH

	display_player_score()

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
