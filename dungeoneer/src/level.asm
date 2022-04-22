; level.asm
;   level handling

.proc level1
    mwa level1_map.map LEVEL_MAPL
    mwa level1_map.intro LEVEL_INTROL

    display_game_intro()
    rts
.endp

.proc level2
    mwa level2_map.map LEVEL_MAPL
    mwa level2_map.intro LEVEL_INTROL

    display_game_intro()
    rts
.endp

;
; exit level
;
.proc exit_level

    ; top left
    poke_position #0, #0
    tile_is_exit()
    cmp #1
    beq exit

    ; top right
    poke_position #7, #1
    tile_is_exit()
    cmp #1
    beq exit

    ; bottom right
    poke_position #7, #7
    tile_is_exit()
    cmp #1
    beq exit

    ; bottom left
    poke_position #0, #7
    tile_is_exit()
    cmp #1
    beq exit

    jmp done

exit
    ldy #0
    jmp (NEXT_LEVEL)

done
    rts
.endp
