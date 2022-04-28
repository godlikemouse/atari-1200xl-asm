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

.proc level3_main
    mva #1 DISABLE_JOYSTICK
    mwa #level3_map.map LEVEL_MAP
    mwa LEVEL_MAP LEVEL_TRANS_MAP
    rts
.endp

.proc level3_maps1
    mva #1 DISABLE_JOYSTICK
    mwa #level3_map.maps1 LEVEL_MAP
    mwa LEVEL_MAP LEVEL_TRANS_MAP
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
    mwa LEVEL_MAP LEVEL_TRANS_MAP
    rts
.endp

.proc level5_mape1
    mva #1 DISABLE_JOYSTICK
    mwa #level5_map.mape1 LEVEL_MAP
    mwa LEVEL_MAP LEVEL_TRANS_MAP
    rts
.endp

.proc level5_mapw1
    mva #1 DISABLE_JOYSTICK
    mwa #level5_map.mapw1 LEVEL_MAP
    mwa LEVEL_MAP LEVEL_TRANS_MAP
    rts
.endp

.proc level5_mapn1
    mva #1 DISABLE_JOYSTICK
    mwa #level5_map.mapn1 LEVEL_MAP
    mwa LEVEL_MAP LEVEL_TRANS_MAP
    rts
.endp

.proc level5_maps1
    mva #1 DISABLE_JOYSTICK
    mwa #level5_map.maps1 LEVEL_MAP
    mwa LEVEL_MAP LEVEL_TRANS_MAP
    rts
.endp

.proc level5_maps1w1
    mva #1 DISABLE_JOYSTICK
    mwa #level5_map.maps1w1 LEVEL_MAP
    mwa LEVEL_MAP LEVEL_TRANS_MAP
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
    ;mva #1 SKIP_FRAME
    jmp (NEXT_LEVEL)

done
    rts
.endp
