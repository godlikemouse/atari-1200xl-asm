; level.asm
;   level handling

.proc level1
    mwa #level1_map.intro LEVEL_INTRO
    mwa #level1_map.map LEVEL_MAP
    mwa #background_music BGM_ADDR
    mva #0 ITEMS

    display_game_intro()
    rts
.endp

.proc level2
    mwa #level2_map.intro LEVEL_INTRO
    mwa #level2_map.map LEVEL_MAP
    mwa #background_music BGM_ADDR
    mva #0 ITEMS

    display_game_intro()
    rts
.endp

.proc level3
    mwa #level3_map.intro LEVEL_INTRO
    mwa #level3_map.map LEVEL_MAP
    mwa #background_music BGM_ADDR
    mva #0 ITEMS

    display_game_intro()
    rts
.endp

.proc level4
    mwa #level4_map.intro LEVEL_INTRO
    mwa #level4_map.map LEVEL_MAP
    mwa #background_music BGM_ADDR
    mva #0 ITEMS

    display_game_intro()
    rts
.endp

.proc level5
    mwa #level5_map.intro LEVEL_INTRO
    mwa #level5_map.map LEVEL_MAP
    mwa #background_music BGM_ADDR
    mva #0 ITEMS

    display_game_intro()
    rts
.endp

.proc level5_main
    mva #1 DISABLE_JOYSTICK
    mwa #level5_map.map LEVEL_MAP
    display_game_map()
    restore_player_trans()
    mva #0 DISABLE_JOYSTICK
    rts
.endp

.proc level5_mape1
    mva #1 DISABLE_JOYSTICK
    mwa #level5_map.mape1 LEVEL_MAP
    display_game_map()
    restore_player_trans()
    mva #0 DISABLE_JOYSTICK
    rts
.endp

.proc level5_mapw1
    mva #1 DISABLE_JOYSTICK
    mwa #level5_map.mapw1 LEVEL_MAP
    display_game_map()
    restore_player_trans()
    mva #0 DISABLE_JOYSTICK
    rts
.endp

.proc level5_mapn1
    mva #1 DISABLE_JOYSTICK
    mwa #level5_map.mapn1 LEVEL_MAP
    display_game_map()
    restore_player_trans()
    mva #0 DISABLE_JOYSTICK
    rts
.endp

.proc level5_maps1
    mva #1 DISABLE_JOYSTICK
    mwa #level5_map.maps1 LEVEL_MAP
    display_game_map()
    restore_player_trans()
    mva #0 DISABLE_JOYSTICK
    rts
.endp

;
; exit level
;
.proc exit_level

    ; top left
    peek_position #0, #0
    tile_is_exit()
    cmp #1
    beq exit

    ; top right
    peek_position #7, #1
    tile_is_exit()
    cmp #1
    beq exit

    ; bottom right
    peek_position #7, #7
    tile_is_exit()
    cmp #1
    beq exit

    ; bottom left
    peek_position #0, #7
    tile_is_exit()
    cmp #1
    beq exit

    jmp done

exit
    ldy #0
    play_exit_level_sound()
    jmp (NEXT_LEVEL)

done
    rts
.endp

;
; restore player transition horizontal
;   restores the player position
.proc restore_player_trans_h
    ; locate trans position

    mva LEVEL_TRANS_Y POSY
    sta PLAYER_RESET_POSY
    posy_to_tiley()
    sta TILEY

    ; find opposite transition tile
    lda LEVEL_TRANS_TYPE
    cmp #4
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
    reset_player()
    draw_player()
    rts
.endp

;
; restore player trans vertical
;   restores the player position
.proc restore_player_trans_v
    ; locate trans position

    mva LEVEL_TRANS_X POSX
    sta PLAYER_RESET_POSX
    posx_to_tilex()
    sta TILEX

    ; find opposite transition tile
    lda LEVEL_TRANS_TYPE
    cmp #3
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
    reset_player()
    draw_player()
    rts
.endp

;
; restore player trans
;   restores player position based on LEVEL_TRANS_TYPE
.proc restore_player_trans

    lda LEVEL_TRANS_TYPE
    and #1
    cmp #1 ; odd 3N, 5S
    bne even ; even 4E, 6W

odd
    restore_player_trans_v()
    jmp done

even
    restore_player_trans_h()

done
    rts
.endp
