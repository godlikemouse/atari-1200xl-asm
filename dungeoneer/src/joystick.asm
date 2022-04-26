; joystick.asm
;	Joystick movement and handling

;
; can move left
;
.proc can_move_left
	; bounding box check

	; top left
	peek_position #-1, #0
	tile_is_block()
	cmp #1
	beq block

	; bottom left
	peek_position #-1, #8
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
	; bounding box check

	; top right
	peek_position #9, #0
	tile_is_block()
	cmp #1
	beq block

	;bottom right
	peek_position #9, #8
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
	; bounding box check

	; top left
	peek_position #0 #-1
	tile_is_block()
	cmp #1
	beq block

	; top right
	peek_position #8 #-1
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
	; bounding box check

	; bottom left
	peek_position #0, #9
	tile_is_block()
	cmp #1
	beq block

	tile_is_locked_proxy()
	cmp #1
	beq block

	; bottom right
	peek_position #8, #9
	tile_is_block()
	cmp #1
	beq block

	tile_is_locked_proxy()
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

	lda DISABLE_JOYSTICK
	cmp #1
	beq done

	lda DISPLAY_TYPE
	cmp #2
	bne done

	lda PLAYER_DEATH
	cmp #1
	beq done

	lda STICK0
	cmp #NONE
	beq move_none
	cmp #LEFT
	beq move_left
	cmp #RIGHT
	beq move_right
	cmp #UP
	beq move_up
	cmp #DOWN
	beq move_down
	rts

move_left
	can_move_left()
	animate_player_left()
	jmp store_posx

move_right
	can_move_right()
	animate_player_right()
	jmp store_posx

move_up
	can_move_up()
	draw_player()
	animate_player_left()
	jmp post_move

move_down
	can_move_down()
	draw_player()
	animate_player_right()
	jmp post_move

move_none
	animate_player_reset()
	rts

post_move
	pickup_item()
	open_door()
	exit_level()
	transition_map_n()
	transition_map_e()
	transition_map_s()
	transition_map_w()
	jmp done

store_posx
	ldx POSX
	stx HPOSP0
	stx HPOSP1
	stx HPOSP2
	stx HPOSP3
	jmp post_move

done
	rts
.endp

;
; read main menu joystick
;	handle menu selection
.proc read_mainmenu_joystick
UP=$0e
DOWN=$0d
NONE=$0f

	lda DISPLAY_TYPE
	cmp #0
	bne done

	lda BTN0
	cmp #0
	beq button_pressed

	lda STICK0
	cmp #NONE
	beq done
	cmp #UP
	beq move_up
	cmp #DOWN
	beq move_down

	jmp done

move_up
	play_mainmenu_item_sound()
	mva #0 MENU_SELECTION
	jmp done

move_down
	play_mainmenu_item_sound()
	mva #1 MENU_SELECTION
	jmp done

button_pressed
	lda MENU_SELECTION
	cmp #0
	beq start_new_game
	jmp done

start_new_game
	new_game()
	jmp done

done
	rts
.endp

;
; reset player
;
.proc reset_player
	mva PLAYER_RESET_POSY POSY
	lda PLAYER_RESET_POSX
	sta POSX
	sta HPOSP0
	sta HPOSP1
	sta HPOSP2
	clear_pmg()
	rts
.endp
