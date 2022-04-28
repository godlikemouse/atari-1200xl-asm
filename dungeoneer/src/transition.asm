; transition.asm
;   map transition functionality

;
; setup player transition
;   routes to the correct transition proc
.proc setup_player_trans
    ; determine if trans type is even or odd
    lda LEVEL_TRANS_TYPE
    lsr
    bcc even

odd
    setup_player_trans_v()
    jmp done

even
    setup_player_trans_h()

done
    rts
.endp

;
; setup player trans vertical
;   sets up the player position
.proc setup_player_trans_v
    ; locate trans position

    ldx LEVEL_TRANS_X
    stx POSX
    stx PLAYER_RESET_POSX
    posx_to_tilex()
    sta TILEX

    ; find opposite transition tile
    ldx LEVEL_TRANS_TYPE
    cpx #3
    bne south

north
    find_tiley TILEX, #$5d
    sub #2 ; offset tile by 2
    jmp done

south
    find_tiley TILEX, #$5c
    add #2 ; offset tile by 2

done
    sta TILEY

    ; set new player position
    tiley_to_posy()
    sta PLAYER_RESET_POSY

    rts
.endp

;
; setup player transition horizontal
;   sets up the player transition position
.proc setup_player_trans_h

    ldx LEVEL_TRANS_Y
    stx POSY
    stx PLAYER_RESET_POSY
    posy_to_tiley()
    sta TILEY

    ; find opposite transition tile
    ldx LEVEL_TRANS_TYPE
    cpx #4
    bne west

east
    find_tilex TILEY, #$5f
    add #2 ; offset tile by 2 ->
    jmp done

west
    find_tilex TILEY, #$5e
    sub #2 ; offset tile by 2 <-

done
    sta TILEX

    ; set new player position
    tilex_to_posx()
    sta PLAYER_RESET_POSX

    rts
.endp

;
; transition map north
;
.proc transition_map_n

	; top right
	peek_position #7, #1
	tile_is_transition_n()
	cmp #1
	beq transition

	; top left
	peek_position #0, #0
	tile_is_transition_n()
	cmp #1
	beq transition

	jmp done

transition
	mvx POSX LEVEL_TRANS_X
	mvx POSY LEVEL_TRANS_Y
	mvx #3 LEVEL_TRANS_TYPE
	jmp (LEVEL_TRANS_N)

done
	rts
.endp

;
; transition map east
;
.proc transition_map_e

	; top right
	peek_position #7, #1
	tile_is_transition_e()
	cmp #1
	beq transition

	; bottom right
	peek_position #7, #7
	tile_is_transition_e()
	cmp #1
	beq transition

	jmp done

transition
	mvx POSX LEVEL_TRANS_X
	mvx POSY LEVEL_TRANS_Y
	mvx #4 LEVEL_TRANS_TYPE
	jmp (LEVEL_TRANS_E)

done
	rts
.endp

;
; transition map south
;
.proc transition_map_s

	; bottom right
	peek_position #7, #7
	tile_is_transition_s()
	cmp #1
	beq transition

	; bottom left
	peek_position #0, #7
	tile_is_transition_s()
	cmp #1
	beq transition

	jmp done

transition
	mvx POSX LEVEL_TRANS_X
	mvx POSY LEVEL_TRANS_Y
	mvx #5 LEVEL_TRANS_TYPE
	jmp (LEVEL_TRANS_S)

done
	rts
.endp

;
; transition map west
;
.proc transition_map_w

	; top left
	peek_position #0, #0
	tile_is_transition_w()
	cmp #1
	beq transition

	; bottom left
	peek_position #0, #7
	tile_is_transition_w()
	cmp #1
	beq transition

	jmp done

transition
	mvx POSX LEVEL_TRANS_X
	mvx POSY LEVEL_TRANS_Y
	mvx #6 LEVEL_TRANS_TYPE
	jmp (LEVEL_TRANS_W)

done
	rts
.endp

;
; check transition
;
.proc check_transition
    transition_map_n()
    transition_map_e()
    transition_map_s()
    transition_map_w()
    rts
.endp

;
; transition map
;
.proc transition_map
    ldx LEVEL_TRANS_MAP
    cpx #0
    beq done

    setup_player_trans()
    display_game_map()
    reset_player()

    mvx #0 LEVEL_TRANS_MAP
    mvx #0 DISABLE_JOYSTICK
    mvx #1 RESTORE_KEY
    mvx #1 SKIP_FRAME
done
    rts
.endp

;
; restore key state
;	restore key item state after screen transitions
;   uses current acc to compare
.proc restore_key_state

    ldx RESTORE_KEY
    cpx #1
    bne done

    ; do we have a key
    lda ITEMS
    and #1
    cmp #1
    bne done

    ldy #0
loop
    lda GAME_SCREEN,y
    cmp #$20
	bne next
	mva #0 GAME_SCREEN,y
	jmp next_2

next
	cmp #$21
	bne upper
    mva #0 GAME_SCREEN,y

upper
    lda GAME_SCREEN+240,y
    cmp #$20
	bne next_2
	mva #0 GAME_SCREEN+240,y
	jmp continue

next_2
    lda GAME_SCREEN+240,y
	cmp #$21
	bne continue
    mva #0 GAME_SCREEN+240,y

continue
    iny
    cpy #240
    bne loop
    mvx #0 RESTORE_KEY
    mvx #1 SKIP_FRAME

done
	rts
.endp
