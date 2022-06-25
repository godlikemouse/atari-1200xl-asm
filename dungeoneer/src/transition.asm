; transition.asm
;   map transition functionality

;
; setup player trans
;   sets up the player transition position
.proc setup_player_trans

    jmp direction

    ; locate trans position
north
    ldx LEVEL_TRANS_X
    stx POSX
    stx PLAYER_RESET_POSX
    ; search from previous tile
    ldx LEVEL_TRANS_TX
    stx TILEX
    find_tiley TILEX, #$5d
    sub #1 ; offset tile by 2 ↑
    sta TILEY
    ; set new player position
    tiley_to_posy()
    sta PLAYER_RESET_POSY
    jmp done

east
    ldx LEVEL_TRANS_Y
    stx POSY
    stx PLAYER_RESET_POSY
    ; search from previous tile
    ldx LEVEL_TRANS_TY
    stx TILEY
    find_tilex TILEY, #$5f
    add #2 ; offset tile by 2 →
    sta TILEX
    ; set new player position
    tilex_to_posx()
    sta PLAYER_RESET_POSX
    jmp done

direction
    ; find opposite transition tile
    ldx LEVEL_TRANS_TYPE
    cpx #3
    beq north
    cpx #4
    beq east
    cpx #5
    beq south
    cpx #6
    beq west
    jmp done

south
    ldx LEVEL_TRANS_X
    stx POSX
    stx PLAYER_RESET_POSX
    ; search from previous tile
    ldx LEVEL_TRANS_TX
    stx TILEX
    find_tiley TILEX, #$5c
    add #1 ; offset tile by 1 ↓
    sta TILEY
    ; set new player position
    tiley_to_posy()
    sta PLAYER_RESET_POSY
    jmp done

west
    ldx LEVEL_TRANS_Y
    stx POSY
    stx PLAYER_RESET_POSY
    ; search from previous tile
    ldx LEVEL_TRANS_TY
    stx TILEY
    find_tilex TILEY, #$5e
    sub #2 ; offset tile by 2 ←
    sta TILEX
    ; set new player position
    tilex_to_posx()
    sta PLAYER_RESET_POSX

done
    rts
.endp

;
; check transition
;   checks for transition interactions
.proc check_transition

    ; east
    peek_position #7, #4
    tile_is_transition_e()
	cpx #1
	beq transition_e

    ;west
    peek_position #0, #4
    tile_is_transition_w()
	cpx #1
	beq transition_w

    ; north
    peek_position #4, #0
    tile_is_transition_n()
	cpx #1
	beq transition_n

    ; south
    peek_position #4, #7
    tile_is_transition_s()
	cpx #1
	beq transition_s

    jmp done

transition_n
    mvx POSX LEVEL_TRANS_X
    mvx POSY LEVEL_TRANS_Y
    mvx TILEX LEVEL_TRANS_TX
    mvx TILEY LEVEL_TRANS_TY
    mvx #3 LEVEL_TRANS_TYPE
    jmp (LEVEL_TRANS_N)

transition_e
    mvx POSX LEVEL_TRANS_X
    mvx POSY LEVEL_TRANS_Y
    mvx TILEX LEVEL_TRANS_TX
    mvx TILEY LEVEL_TRANS_TY
    mvx #4 LEVEL_TRANS_TYPE
    jmp (LEVEL_TRANS_E)

transition_w
    mvx POSX LEVEL_TRANS_X
    mvx POSY LEVEL_TRANS_Y
    mvx TILEX LEVEL_TRANS_TX
    mvx TILEY LEVEL_TRANS_TY
    mvx #6 LEVEL_TRANS_TYPE
    jmp (LEVEL_TRANS_W)

transition_s
    mvx POSX LEVEL_TRANS_X
    mvx POSY LEVEL_TRANS_Y
    mvx TILEX LEVEL_TRANS_TX
    mvx TILEY LEVEL_TRANS_TY
    mvx #5 LEVEL_TRANS_TYPE
    jmp (LEVEL_TRANS_S)

done
    rts
.endp

;
; transition map handler
;   handles map transition
.proc transition_map_handler()
    ldx LEVEL_TRANS_MAP
    cpx #0
    beq done

    mvx #1 VBLANK_SKIP
    mvx #0 SCREEN_LOADED

    ldx #0
    stx ENEMY_POSX
    stx ENEMY_POSY
    clear_enemy_pmg()
    display_game_map()
    setup_player_trans()
    reset_player()

    ldx #1
    stx RESTORE_DOOR
    stx RESTORE_KEY
    stx RESTORE_COIN
    stx SCREEN_LOADED

    ldx #0
    stx LEVEL_TRANS_MAP
    stx DISABLE_JOYSTICK

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
    bne exit

    ldx LEVEL_HAS_KEY
    cpx #1
    bne done

    ldx DOOR_OPENED
    cpx #1
    beq remove_key

    ; do we have a key
    lda ITEMS
    and #1
    cmp #1
    bne replace_key

remove_key
    ; check all tiles for key and remove
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
    jmp done

replace_key
    tile_to_tileptr KEY_POSX, KEY_POSY
    ldy #0
    mva #$20 (TILEPTR),y+
    mva #$21 (TILEPTR),y

done
    mvx #0 RESTORE_KEY

exit
	rts
.endp

;
; restore coin state
;
.proc restore_coin_state
.var _tilex .byte
.var _tiley .byte
.var _count .byte

    ldx RESTORE_COIN
    cpx #1
    bne exit

    ; find level in memory location
    mwx LEVEL_ATTRS TMP0

    ; find level in memory location
    ldy #0
	lda (TMP0),y
	cmp #7 ; validate
	bne done

    iny ; move to count
    mva (TMP0),y _count
    adb #2 _count

    iny ; move to first coin state slot
loop
    ; verify slot contains a value
    lda (TMP0),y+ ; tilex
    cmp #$ff
    beq done

    ; restore coin state
    dey
    mva (TMP0),y+ _tilex
    mva (TMP0),y+ _tiley

    ; find location on map
    tile_to_tileptr _tilex, _tiley
    tya
    tax
    ldy #0
    lda #0
    sta (TILEPTR),y+
    sta (TILEPTR),y
    txa
    tay

    cpy _count
    bne loop

done
    ldx #0
    stx RESTORE_COIN
    stx VBLANK_SKIP

exit
    rts
.endp

;
; restore door state
;
.proc restore_door_state
.var _count .byte

    ldx RESTORE_DOOR
    cpx #1
    bne exit

    ldx LEVEL_HAS_DOOR
    cpx #1
    bne done

    ldx DOOR_OPENED
    cpx #1
    bne done

    ; check all tiles for closed door
    ldy #0
    sty _count
    mwx #GAME_SCREEN TILEPTR
loop
    lda (TILEPTR),y+
    cmp #$14
    beq found
    cpy #240
    bne loop

    ldx _count
    cpx #1
    beq done

    adw TILEPTR #240
    ldy #0
    mvx #1 _count
    jmp loop

found
    dey
    mva #$44 (TILEPTR),y+
    mva #$45 (TILEPTR),y+
    mva #$46 (TILEPTR),y+
    mva #$47 (TILEPTR),y

done
    mvx #0 RESTORE_DOOR

exit
	rts
.endp
