; joystick.asm
;	Joystick movement and handling

;
; can move left
;
.proc can_move_left
	; bounding box check

	; top left
	peek_position #-1, #1
	tile_is_locked_proxy()
	cmp #1
	beq block

	tile_is_block()
	cmp #1
	beq block

	; bottom left
	peek_position #-1, #7
	tile_is_locked_proxy()
	cmp #1
	beq block

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
	peek_position #9, #1
	tile_is_locked_proxy()
	cmp #1
	beq block

	tile_is_block()
	cmp #1
	beq block

	;bottom right
	peek_position #9, #7
	tile_is_locked_proxy()
	cmp #1
	beq block

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
	tile_is_locked_proxy()
	cmp #1
	beq block

	tile_is_block()
	cmp #1
	beq block

	; top right
	peek_position #8 #-1
	tile_is_locked_proxy()
	cmp #1
	beq block

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
	peek_position #0, #8
	tile_is_locked_proxy()
	cmp #1
	beq block

	tile_is_block()
	cmp #1
	beq block

	; bottom right
	peek_position #8, #8
	tile_is_locked_proxy()
	cmp #1
	beq block

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

	ldx DISABLE_JOYSTICK
	cpx #1
	beq done

	ldx DISPLAY_TYPE
	cpx #2
	bne done

	ldx PLAYER_DEATH
	cpx #1
	beq done

	ldx STICK0
	cpx #NONE
	beq move_none
	cpx #LEFT
	beq move_left
	cpx #RIGHT
	beq move_right
	cpx #UP
	beq move_up
	cpx #DOWN
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
	check_transition()
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

	ldx DISPLAY_TYPE
	cpx #0
	bne done

	ldx BTN0
	cpx #0
	beq button_pressed

	ldx STICK0
	cpx #NONE
	beq done
	cpx #UP
	beq move_up
	cpx #DOWN
	beq move_down

	jmp done

move_up
	play_mainmenu_item_sound()
	mvx #0 MENU_SELECTION
	jmp done

move_down
	play_mainmenu_item_sound()
	mvx #1 MENU_SELECTION
	jmp done

button_pressed
	ldx MENU_SELECTION
	cpx #0
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
	mvx PLAYER_RESET_POSY POSY
	ldx PLAYER_RESET_POSX
	stx POSX
	stx HPOSP0
	stx HPOSP1
	stx HPOSP2
	clear_pmg()
	rts
.endp
