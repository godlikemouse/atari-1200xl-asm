; level.asm
;   level handling

.proc level1
    mwx #level1_map.intro LEVEL_INTRO
    mwx #level1_map.map LEVEL_MAP
    mwx #background_music BGM_ADDR
    mvx #0 ITEMS
    mvx #1 LEVEL_HAS_KEY

    display_game_intro()
    rts
.endp

.proc level2
    mwx #level2_map.intro LEVEL_INTRO
    mwx #level2_map.map LEVEL_MAP
    mwx #background_music BGM_ADDR
    mvx #0 ITEMS
    mvx #1 LEVEL_HAS_KEY

    display_game_intro()
    rts
.endp

.proc level3_setup
    reset_coin_state #<level3_map.maps1 #>level3_map.maps1

    mvx #1 SKIP_FRAME
    mwx #0 SEQUENCE
    rts
.endp

.proc level3
    mwx #level3_map.intro LEVEL_INTRO
    mwx #level3_map.map LEVEL_MAP
    mwx #background_music BGM_ADDR
    mvx #0 ITEMS
    mvx #1 LEVEL_HAS_KEY

    mwx #level3_setup SEQUENCE

    display_game_intro()
    rts
.endp

.proc level3_main
    mvx #1 DISABLE_JOYSTICK
    mwx #level3_map.map LEVEL_MAP
    mwx LEVEL_MAP LEVEL_TRANS_MAP
    mvx #1 LEVEL_HAS_KEY

    rts
.endp

.proc level3_maps1
    mvx #1 DISABLE_JOYSTICK
    mwx #level3_map.maps1 LEVEL_MAP
    mwx LEVEL_MAP LEVEL_TRANS_MAP
    mvx #0 LEVEL_HAS_KEY
    rts
.endp

.proc level4
    mwx #level4_map.intro LEVEL_INTRO
    mwx #level4_map.map LEVEL_MAP
    mwx #background_music BGM_ADDR
    mvx #0 ITEMS
    mvx #0 LEVEL_HAS_KEY

    display_game_intro()
    rts
.endp

.proc level5
    mwx #level5_map.intro LEVEL_INTRO
    mwx #level5_map.map LEVEL_MAP
    mwx #background_music BGM_ADDR
    mvx #0 ITEMS
    mvx #0 LEVEL_HAS_KEY

    mwx #level5_setup SEQUENCE

    display_game_intro()
    rts
.endp

.proc level5_setup
    reset_coin_state #<level5_map.map #>level5_map.map
    reset_coin_state #<level5_map.mape1 #>level5_map.mape1
    reset_coin_state #<level5_map.mapw1 #>level5_map.mapw1

    mvx #1 SKIP_FRAME
    mwx #level5_setup2 SEQUENCE
    rts
.endp

.proc level5_setup2
    reset_coin_state #<level5_map.mapn1 #>level5_map.mapn1
    reset_coin_state #<level5_map.maps1w1 #>level5_map.maps1w1

    mvx #1 SKIP_FRAME
    mwx #0 SEQUENCE
    rts
.endp

.proc level5_main
    mvx #1 DISABLE_JOYSTICK
    mwx #level5_map.map LEVEL_MAP
    mwx LEVEL_MAP LEVEL_TRANS_MAP
    mvx #0 LEVEL_HAS_KEY
    rts
.endp

.proc level5_mape1
    mvx #1 DISABLE_JOYSTICK
    mwx #level5_map.mape1 LEVEL_MAP
    mwx LEVEL_MAP LEVEL_TRANS_MAP
    mvx #1 LEVEL_HAS_KEY
    rts
.endp

.proc level5_mapw1
    mvx #1 DISABLE_JOYSTICK
    mwx #level5_map.mapw1 LEVEL_MAP
    mwx LEVEL_MAP LEVEL_TRANS_MAP
    mvx #0 LEVEL_HAS_KEY
    rts
.endp

.proc level5_mapn1
    mvx #1 DISABLE_JOYSTICK
    mwx #level5_map.mapn1 LEVEL_MAP
    mwx LEVEL_MAP LEVEL_TRANS_MAP
    mvx #0 LEVEL_HAS_KEY
    rts
.endp

.proc level5_maps1
    mvx #1 DISABLE_JOYSTICK
    mwx #level5_map.maps1 LEVEL_MAP
    mwx LEVEL_MAP LEVEL_TRANS_MAP
    mvx #0 LEVEL_HAS_KEY
    rts
.endp

.proc level5_maps1w1
    mvx #1 DISABLE_JOYSTICK
    mwx #level5_map.maps1w1 LEVEL_MAP
    mwx LEVEL_MAP LEVEL_TRANS_MAP
    mvx #0 LEVEL_HAS_KEY
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

;
; reset coin state
;   resets current coin state for a map
.proc reset_coin_state (.byte mapl+1, maph+1) .var
mapl mvx #0 TMP0
maph mvx #0 TMP1
map = mapl

    adw TMP0 #480

    ldy #0
    iny ; marker

    iny ; count
    lda (TMP0),y
    tax

    lda #$ff
loop
    sta (TMP0),y
    dex
    bne loop

    rts
.endp

;
; sequence handler
;   handles sequence jumps
.proc sequence_handler

    ldx SEQUENCE
    cpx #0
    beq done

    jmp (SEQUENCE)

done
    rts
.endp
