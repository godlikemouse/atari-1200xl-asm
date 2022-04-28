; level.asm
;   level handling

.proc level1
    mwx #level1_map.intro LEVEL_INTRO
    mwx #level1_map.map LEVEL_MAP
    mwx #background_music BGM_ADDR
    mvx #0 ITEMS

    display_game_intro()
    rts
.endp

.proc level2
    mwx #level2_map.intro LEVEL_INTRO
    mwx #level2_map.map LEVEL_MAP
    mwx #background_music BGM_ADDR
    mvx #0 ITEMS

    display_game_intro()
    rts
.endp

.proc level3
    mwx #level3_map.intro LEVEL_INTRO
    mwx #level3_map.map LEVEL_MAP
    mwx #background_music BGM_ADDR
    mvx #0 ITEMS

    display_game_intro()
    rts
.endp

.proc level3_main
    mvx #1 DISABLE_JOYSTICK
    mwx #level3_map.map LEVEL_MAP
    mwx LEVEL_MAP LEVEL_TRANS_MAP
    rts
.endp

.proc level3_maps1
    mvx #1 DISABLE_JOYSTICK
    mwx #level3_map.maps1 LEVEL_MAP
    mwx LEVEL_MAP LEVEL_TRANS_MAP
    rts
.endp

.proc level4
    mwx #level4_map.intro LEVEL_INTRO
    mwx #level4_map.map LEVEL_MAP
    mwx #background_music BGM_ADDR
    mvx #0 ITEMS

    display_game_intro()
    rts
.endp

.proc level5
    mwx #level5_map.intro LEVEL_INTRO
    mwx #level5_map.map LEVEL_MAP
    mwx #background_music BGM_ADDR
    mvx #0 ITEMS

    display_game_intro()
    rts
.endp

.proc level5_main
    mvx #1 DISABLE_JOYSTICK
    mwx #level5_map.map LEVEL_MAP
    mwx LEVEL_MAP LEVEL_TRANS_MAP
    rts
.endp

.proc level5_mape1
    mvx #1 DISABLE_JOYSTICK
    mwx #level5_map.mape1 LEVEL_MAP
    mwx LEVEL_MAP LEVEL_TRANS_MAP
    rts
.endp

.proc level5_mapw1
    mvx #1 DISABLE_JOYSTICK
    mwx #level5_map.mapw1 LEVEL_MAP
    mwx LEVEL_MAP LEVEL_TRANS_MAP
    rts
.endp

.proc level5_mapn1
    mvx #1 DISABLE_JOYSTICK
    mwx #level5_map.mapn1 LEVEL_MAP
    mwx LEVEL_MAP LEVEL_TRANS_MAP
    rts
.endp

.proc level5_maps1
    mvx #1 DISABLE_JOYSTICK
    mwx #level5_map.maps1 LEVEL_MAP
    mwx LEVEL_MAP LEVEL_TRANS_MAP
    rts
.endp

.proc level5_maps1w1
    mvx #1 DISABLE_JOYSTICK
    mwx #level5_map.maps1w1 LEVEL_MAP
    mwx LEVEL_MAP LEVEL_TRANS_MAP
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
    play_exit_level_sound()
    jmp (NEXT_LEVEL)

done
    rts
.endp
