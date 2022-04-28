; item.asm
;	Game pickup items

;
; display screen items
;	shows picked up items at the top of the screen
.proc display_screen_items
	clear_screen_items()
	; key 1
	display_screen_key #1, #$20, #$0 ; ITEMS (.......K)
	; key 2
	display_screen_key #2, #$22, #$2 ; ITEMS  (......K.)
	; key 3
	display_screen_key #4, #$24, #$4 ; ITEMS  (.....K..)
	; key 4
	display_screen_key #8, #$26, #$6 ; ITEMS  (....K...)
	rts
.endp

;
; clear screen items
;
.proc clear_screen_items

	lda #0
	ldy #0
loop
	sta ITEM_SCREEN,y+
	cpy #8
	bne loop
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
.var _item_idx .byte
.var _charset_idx .byte
.var _screen_idx .byte
item_idx mva #0 _item_idx
charset_idx mva #0 _charset_idx
screen_idx mva #0 _screen_idx

	lda ITEMS
	and _item_idx
	cmp _item_idx
	bne done

	lda _charset_idx
	ldy _screen_idx
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

	; score is kept in 4 byte (nibble) per memory location
	ldy #22
	ldx #0
loop
	; get lower nibble (XN)
	lda PLAYER_SCORE,x
	and #$0f
	display_number()

	; get upper nibble (NX)
	lda PLAYER_SCORE,x
	and #$f0
	:4 lsr
	display_number()

	inx
	cpx #2
	bne loop
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
;	score is stored in nibbles (ie. 0050 lbyte: 50, hbyte: 00)
.proc add_score (.byte lbyte+1, hbyte+1) .var
.var _lbyte .byte
.var _hbyte .byte
.var _carry .byte
.var _nibble .byte
.var _temp .byte
lbyte mvx #0 _lbyte
hbyte mvx #0 _hbyte

	ldy #0
	mvx #0 _carry
loop
	add_lower_nibble()
	add_upper_nibble()
	iny
	cpy #2
	bne loop

	display_player_score()
	rts

; add lower nibble with overflow
.proc add_lower_nibble

	; store lower nibble (XN)
	lda _lbyte,y
	and #$0f
	sta _nibble

	; load score lower nibble (XN)
	lda PLAYER_SCORE,y
	and #$0f

	; add to score nibble with carry (XN)
	add _nibble
	add _carry

	; check for overflow (XN)
	cmp #10
	bcc no_carry
	jmp with_carry

no_carry
	; no carry, just store and move on (XN)
	sta _nibble
	mvx #0 _carry ; no overflow
	jmp done

with_carry
	; sub 10, then set the carry into next nibble (ON)
	sub #10
	sta _nibble
	mvx #1 _carry ; overflow
	jmp done

done
	; done with (XN), store in player score
	lda PLAYER_SCORE,y
	and #$f0
	ora _nibble
	sta PLAYER_SCORE,y
	rts
.endp

; add upper nibble with overflow
.proc add_upper_nibble

	; store higher nibble of score (NX)
	and #$f0
	:4 lsr
	sta _nibble

	; check high nibble for overflow (ONX)
	lda _lbyte,y
	and #$f0
	:4 lsr
	add _carry ; overflow
	add _nibble
	cmp #10
	bcc no_carry
	jmp with_carry

no_carry
	; no carry, just store and move on (NX)
	sta _nibble
	mvx #0 _carry ; no overflow
	jmp done

with_carry
	; sub 10, then set the carry into the next nibble (ONX)
	sub #10
	sta _nibble
	mvx #1 _carry ; overflow
	jmp done

done
	; done with lower byte, store (NN)
	lda PLAYER_SCORE,y
	and #$0f
	sta _temp
	lda _nibble
	:4 asl
	ora _temp
	sta PLAYER_SCORE,y
	rts
.endp

	rts
.endp


;
; pickup item
;   determines if collision is with a pickup item
.proc pickup_item
	; bounding box for pickup

	; top left
	peek_position #1, #1
	tile_is_item()
	cmp #1
	beq pickup
	check_player_death()

	; top right
	peek_position #7, #1
	tile_is_item()
	cmp #1
	beq pickup
	check_player_death()

	; bottom right
	peek_position #7, #7
	tile_is_item()
	cmp #1
	beq pickup
	check_player_death()

	; bottom left
	peek_position #1, #7
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
	add_score #$5, #$00

	rts
.endp

;
; has key
;	acc == 0 if false, else acc > 0
.proc has_key(.byte key+1) .var
.var _key .byte
key mva #0 _key

	and ITEMS

	rts
.endp

;
; open door
;
.proc open_door

	; bounding box for contact

	; top left
	peek_position #0, #0
	tile_is_proxy()
	cmp #1
	beq done

	; top right
	peek_position #7, #1
	tile_is_proxy()
	cmp #1
	beq done

	; bottom right
	peek_position #7, #7
	tile_is_proxy()
	cmp #1
	beq done

	; bottom left
	peek_position #0, #7
	tile_is_proxy()
	cmp #1
	beq done

done

	rts
.endp

;
; remove playfield item
;
.proc remove_playfield_item
	; remember first encountered tile
	ldy TILEX
	lda (TILEPTR),y
	tax

    ; clear encountered tile
    mva #0 (TILEPTR),y

    ; remove ajoining tile
	txa
    lsr
    bcc even

    ; determine which direction the other tile is in

    ; if odd clear right
    dey
    jmp done

even
    ; if even clear left
    iny

done
    ; clear other tile
    mva #0 (TILEPTR),y
    rts
.endp

;
; get item bit
;   retrives the item bit mask for an ONTILE item
;   stores bit in acc
.proc get_item_bit
.var _bit .byte
.var _counter .byte
.var _item_tile_low .byte
.var _item_tile_high .byte

	; stort inital address and bit values
	mvx #1 _bit
	mvx #$20 _item_tile_low
	mvx #$22 _item_tile_high
	mvx #8 _counter
loop
	; check to see if item exists
	between _item_tile_low, ONTILE, _item_tile_high
	cmp #1
	beq done
	; if not, shift left increase address and continue
	lda _bit
	asl
	sta _bit
	adb _item_tile_low #2
	adb _item_tile_high #2
	dec _counter
	bne loop

done
	lda _bit
	rts
.endp

;
; check player death
;	checks for player death state
.proc check_player_death
	tile_is_death()
	cmp #1
	bne done
	mwx #death_sfx SFX1_ADDR
	mvx #1 SFX1

	ldx PLAYER_DEATH
	cpx #1
	beq done
	mvx #1 PLAYER_DEATH

	dec PLAYER_LIVES
	display_player_lives()

	; reset picked up items
	mvx #0 ITEMS
	display_screen_items()

done
	rts
.endp

;
; check game over
;	checks for game over state
.proc check_game_over
	ldx PLAYER_LIVES
	cpx #0
	bne reload
	display_gameover()
	jmp done

reload
	reload_map()

done
	rts
.endp
