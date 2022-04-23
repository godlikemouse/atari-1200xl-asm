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
    mwa #level5_map.map LEVEL_MAP
    display_game()
    rts
.endp

.proc level5_mape1
    mwa #level5_map.mape1 LEVEL_MAP
    display_game()

    ; locate trans position
    mva LEVEL_TRANS_X TILEX
    mva LEVEL_TRANS_Y TILEY
loop
    dec TILEX
    store_ontile()
    lda ONTILE
    cmp #$5f
    bne loop

    ; offset by 1 tile
    inc TILEX
    lda TILEX
    :2 asl
    add #52
    sta PLAYER_RESET_POSX
    reset_player()
    rts
.endp

.proc level5_mapw1
    mwa #level5_map.mapw1 LEVEL_MAP
    display_game()

    ; locate trans position
    mva LEVEL_TRANS_X TILEX
    mva LEVEL_TRANS_Y TILEY
loop
    inc TILEX
    store_ontile()
    lda ONTILE
    cmp #$5e
    bne loop

    ; offset by 1 tile
    dec TILEX
    dec TILEX
    lda TILEX
    :2 asl
    add #52
    sta PLAYER_RESET_POSX
    reset_player()
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
