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
	tile_is_wall_pasthrough()

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
	tile_is_wall_pasthrough()

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
	tile_is_wall_pasthrough()

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
	tile_is_wall_pasthrough()

block
	rts
.endp

;
; read game joystick
;	handle player movement
.proc read_game_joystick
_up=$0e
_down=$0d
_left=$0b
_right=$07
_none=$0f

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
	cpx #_none
	beq move_none
	cpx #_left
	beq move_left
	cpx #_right
	beq move_right
	cpx #_up
	beq move_up
	cpx #_down
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
_up=$0e
_down=$0d
_none=$0f
_delay=10
_min=0
_max=2

	ldx DISPLAY_TYPE
	cpx #0
	bne done

	ldx MENU_BTN_COUNT
	cpx #0
	bne delay_button

	ldx BTN0
	cpx #0
	beq button_pressed

	ldx STICK0
	cpx #_none
	beq done
	cpx #_up
	beq move_up
	cpx #_down
	beq move_down

	jmp done

done
	rts

move_up
	ldx MENU_SELECTION

	; wrap check
	cpx #_min
	beq done

	; skip on how to/credit screen
	cpx #3
	beq done

	cpx PREV_MENU_SELECT
	beq up_skip_sound
	play_mainmenu_item_sound()
up_skip_sound
	mvx MENU_SELECTION PREV_MENU_SELECT
	dec MENU_SELECTION
	mvx #_delay MENU_BTN_COUNT
	jmp done

move_down
	ldx MENU_SELECTION

	; wrap check
	cpx #_max
	beq done

	; skip on how to screen
	cpx #3
	beq done

	cpx PREV_MENU_SELECT
	beq down_skip_sound
	play_mainmenu_item_sound()
down_skip_sound
	mvx MENU_SELECTION PREV_MENU_SELECT
	inc MENU_SELECTION
	mvx #_delay MENU_BTN_COUNT
	jmp done

delay_button
	dec MENU_BTN_COUNT
	jmp done

button_pressed
	ldx MENU_SELECTION

	cpx #0
	beq selection_newgame

	cpx #1
	beq selection_howtoplay

	cpx #2
	beq selection_credits

	cpx #3
	beq selection_mainmenu

	jmp done

selection_howtoplay
	display_howtoplay()
	mvx #_delay MENU_BTN_COUNT
	jmp done

selection_newgame
	new_game()
	mvx #_delay MENU_BTN_COUNT
	jmp done

selection_mainmenu
	display_mainmenu()
	mvx #_delay MENU_BTN_COUNT
	jmp done

selection_credits
	display_credits()
	mvx #_delay MENU_BTN_COUNT
	jmp done

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
	clear_player_pmg()
	rts
.endp
