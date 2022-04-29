; transition.asm
;   map transition functionality

;
; setup player trans
;   sets up the player transition position
.proc setup_player_trans

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

    ; locate trans position
north
    ldx LEVEL_TRANS_X
    stx POSX
    stx PLAYER_RESET_POSX
    posx_to_tilex()
    sta TILEX
    find_tiley TILEX, #$5d
    sub #2 ; offset tile by 2 <-
    sta TILEY
    ; set new player position
    tiley_to_posy()
    sta PLAYER_RESET_POSY
    jmp done

east
    ldx LEVEL_TRANS_Y
    stx POSY
    stx PLAYER_RESET_POSY
    posy_to_tiley()
    sta TILEY
    find_tilex TILEY, #$5f
    add #2 ; offset tile by 2 ->
    sta TILEX
    ; set new player position
    tilex_to_posx()
    sta PLAYER_RESET_POSX
    jmp done

south
    ldx LEVEL_TRANS_X
    stx POSX
    stx PLAYER_RESET_POSX
    posx_to_tilex()
    sta TILEX
    find_tiley TILEX, #$5c
    add #2 ; offset tile by 2 ->
    sta TILEY
    ; set new player position
    tiley_to_posy()
    sta PLAYER_RESET_POSY
    jmp done

west
    ldx LEVEL_TRANS_Y
    stx POSY
    stx PLAYER_RESET_POSY
    posy_to_tiley()
    sta TILEY
    find_tilex TILEY, #$5e
    sub #2 ; offset tile by 2 <-
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

    ; top right
    peek_position #7, #1
    tile_is_transition_n()
    cpx #1
    beq transition_n
    tile_is_transition_e()
	cpx #1
	beq transition_e

    ; top left
    peek_position #0, #0
    tile_is_transition_n()
    cpx #1
    beq transition_n
    tile_is_transition_w()
	cpx #1
	beq transition_w

    ; bottom right
	peek_position #7, #7
	tile_is_transition_s()
	cpx #1
	beq transition_s
    tile_is_transition_e()
	cpx #1
	beq transition_e

    ; bottom left
	peek_position #0, #7
	tile_is_transition_w()
	cpx #1
	beq transition_w
    tile_is_transition_s()
	cpx #1
	beq transition_s

    jmp done

transition_n
    mvx POSX LEVEL_TRANS_X
    mvx POSY LEVEL_TRANS_Y
    mvx #3 LEVEL_TRANS_TYPE
    jmp (LEVEL_TRANS_N)

transition_e
	mvx POSX LEVEL_TRANS_X
	mvx POSY LEVEL_TRANS_Y
	mvx #4 LEVEL_TRANS_TYPE
	jmp (LEVEL_TRANS_E)

transition_w
	mvx POSX LEVEL_TRANS_X
	mvx POSY LEVEL_TRANS_Y
	mvx #6 LEVEL_TRANS_TYPE
	jmp (LEVEL_TRANS_W)

transition_s
	mvx POSX LEVEL_TRANS_X
	mvx POSY LEVEL_TRANS_Y
	mvx #5 LEVEL_TRANS_TYPE
	jmp (LEVEL_TRANS_S)

done
    rts
.endp

;
; transition map
;   handles map transition
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
    mvx #1 RESTORE_COIN
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

    mvx #0 RESTORE_KEY
    mvx #1 SKIP_FRAME

done
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
    bne done

    ; find level in memory location
    mwx LEVEL_MAP TMP0

    ; find level in memory location
    ldy #0
    mwx LEVEL_MAP TMP0
    adw TMP0 #480 ; offset to coin state location
	lda (TMP0),y
	cmp #7 ; validate
	bne continue

    iny ; move to count
    mva (TMP0),y _count

    iny ; move to first coin state slot
loop
    ; verify slot contains a value
    lda (TMP0),y+ ; tilex
    cmp #$ff
    beq continue

    ; restore coin state
    dey
    mva (TMP0),y+ _tilex
    mva (TMP0),y+ _tiley

    ; find location on map
    tile_to_map _tilex, _tiley
    mwx TILEPTR $11c
    tya
    tax
    ldy #0
    lda #0
    sta (TILEPTR),y+
    sta (TILEPTR),y
    txa
    tay

    ;dec _count
    ;bne loop

    mvx #1 SKIP_FRAME

continue
    mvx #0 RESTORE_COIN

done
    rts
.endp
