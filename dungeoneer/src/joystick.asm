; joystick.asm
;	Joystick movement and handling

;
; can move left
;
.proc can_move_left
dx=TMP2
dy=TMP3
	; bounding box check

	; top left
	poke_position #-1, #0
	tile_is_block()
	cmp #1
	beq block

	; bottom left
	poke_position #-1, #8
	tile_is_block()
	cmp #1
	beq block

	; move player
	dec POSX
block
	rts
.endp

;
; can move right
;
.proc can_move_right
dx=TMP2
dy=TMP3
	; bounding box check

	; top right
	poke_position #9, #0
	tile_is_block()
	cmp #1
	beq block

	;bottom right
	poke_position #9, #8
	tile_is_block()
	cmp #1
	beq block

	; move player
	inc POSX
block
	rts
.endp

;
; can move up
;
.proc can_move_up
dx=TMP2
dy=TMP3
	; bounding box check

	; top left
	poke_position #0 #-1
	tile_is_block()
	cmp #1
	beq block

	; top right
	poke_position #8 #-1
	tile_is_block()
	cmp #1
	beq block

	; move player
	dec POSY
	clear_player_vertical()
block
	rts
.endp

;
; can move down
;
.proc can_move_down
dx=TMP2
dy=TMP3
	; bounding box check

	; bottom left
	poke_position #0, #9
	tile_is_block()
	cmp #1
	beq block

	; bottom right
	poke_position #8, #9
	tile_is_block()
	cmp #1
	beq block

	inc POSY
	clear_player_vertical()
block
	rts
.endp

;
; read game joystick
;	handle player movement
.proc read_game_joystick
UP=$0e
DOWN=$0d
LEFT=$0b
RIGHT=$07
NONE=$0f

	lda DISPLAY_TYPE
	cmp #1
	bne done

	lda STICK0
	cmp #LEFT
	beq move_left
	cmp #RIGHT
	beq move_right
	cmp #UP
	beq move_up
	cmp #DOWN
	beq move_down
	cmp #NONE
	beq move_none
	rts

move_left
	can_move_left()
	animate_player_left()
	pickup_item()
	jmp store_posx

move_right
	can_move_right()
	animate_player_right()
	pickup_item()
	jmp store_posx

move_up
	can_move_up()
	draw_player()
	animate_player_left()
	pickup_item()
	jmp done

move_down
	can_move_down()
	draw_player()
	animate_player_right()
	pickup_item()
	jmp done

move_none
	animate_player_reset()
	rts

done
	rts

store_posx
	ldx POSX
	stx HPOSP0
	stx HPOSP1
	stx HPOSP2
	stx HPOSP3
	jmp done
.endp

;
; read main menu joystick
;	handle menu selection
.proc read_mainmenu_joystick
UP=$0e
DOWN=$0d

	lda DISPLAY_TYPE
	cmp #0
	bne done

	lda STICK0
	cmp #UP
	beq move_up
	cmp #DOWN
	beq move_down

	lda BTN0
	cmp #0
	beq button_pressed

	jmp done

move_up
	mva #0 MENU_SELECTION
	jmp done

move_down
	mva #1 MENU_SELECTION
	jmp done

button_pressed
	display_game()
	jmp done

done
	rts
.endp

;
; reset player
;
.proc reset_player
	mva #$40 POSY
	lda #$80
	sta POSX
	sta HPOSP0
	sta HPOSP1
	sta HPOSP2
	clear_pmg()
	rts
.endp
