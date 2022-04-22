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
