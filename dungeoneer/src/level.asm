; level.asm
;   level handling

;
; level 1
;   handles level 1 loading
.proc level1
    mwx #level1_map.intro LEVEL_INTRO
    mwx #intro_music BGM_ADDR
    mwx #level1_map.map LEVEL_MAP
    mwx #level1_map.attrs LEVEL_ATTRS
    mvx #0 ITEMS
    mvx #1 LEVEL_HAS_KEY

    display_game_intro()
    rts
.endp

;
; level 2
;   handles level 2 loading
.proc level2
    mwx #level2_map.intro LEVEL_INTRO
    mwx #intro_music BGM_ADDR
    mwx #level2_map.map LEVEL_MAP
    mwx #level2_map.attrs LEVEL_ATTRS
    mvx #0 ITEMS
    mvx #1 LEVEL_HAS_KEY

    display_game_intro()
    rts
.endp

;
; level 3
;   handles level 3 loading
.proc level3
    mwx #level3_map.intro LEVEL_INTRO
    mwx #intro_music BGM_ADDR
    mwx #level3_map.map LEVEL_MAP
    mwx #level3_map.attrs LEVEL_ATTRS
    mvx #1 LEVEL_HAS_KEY
    mvx #0 ITEMS
    reset_coin_state #<level3_map.maps1_attrs #>level3_map.maps1_attrs

    display_game_intro()
    rts
.endp

;
; level 3 main
;   handles level 3 transition loading
.proc level3_main
    mvx #1 DISABLE_JOYSTICK
    mwx #level3_map.map LEVEL_MAP
    mwx #level3_map.attrs LEVEL_ATTRS
    mwx LEVEL_MAP LEVEL_TRANS_MAP
    mvx #1 LEVEL_HAS_KEY

    rts
.endp

;
; level 3 map south 1
;   handles level 3 south 1 transition loading
.proc level3_maps1
    mvx #1 DISABLE_JOYSTICK
    mwx #level3_map.maps1 LEVEL_MAP
    mwx #level3_map.maps1_attrs LEVEL_ATTRS
    mwx LEVEL_MAP LEVEL_TRANS_MAP
    mvx #0 LEVEL_HAS_KEY
    rts
.endp

;
; level 4
;   handles level 4 loading
.proc level4
    mwx #level4_map.intro LEVEL_INTRO
    mwx #intro_music BGM_ADDR
    mwx #level4_map.map LEVEL_MAP
    mwx #level4_map.attrs LEVEL_ATTRS
    mvx #0 ITEMS
    mvx #0 LEVEL_HAS_KEY

    display_game_intro()
    rts
.endp

;
; level 5
;   handles level 5 loading
.proc level5
    mwx #level5_map.intro LEVEL_INTRO
    mwx #intro_music BGM_ADDR
    mwx #level5_map.map LEVEL_MAP
    mwx #level5_map.attrs LEVEL_ATTRS
    mvx #0 ITEMS
    mvx #0 LEVEL_HAS_KEY

    reset_coin_state #<level5_map.attrs #>level5_map.attrs
    reset_coin_state #<level5_map.mape1_attrs #>level5_map.mape1_attrs
    reset_coin_state #<level5_map.mapw1_attrs #>level5_map.mapw1_attrs
    reset_coin_state #<level5_map.mapn1_attrs #>level5_map.mapn1_attrs
    reset_coin_state #<level5_map.maps1w1_attrs #>level5_map.maps1w1_attrs

    display_game_intro()
    rts
.endp

;
; level 5 main
;   handles level 5 transition loading
.proc level5_main
    mvx #1 DISABLE_JOYSTICK
    mwx #level5_map.map LEVEL_MAP
    mwx LEVEL_MAP LEVEL_TRANS_MAP
    mwx #level5_map.attrs LEVEL_ATTRS
    mvx #0 LEVEL_HAS_KEY
    rts
.endp

;
; level 5 map east 1
;   handles level 5 map east 1 loading
.proc level5_mape1
    mvx #1 DISABLE_JOYSTICK
    mwx #level5_map.mape1 LEVEL_MAP
    mwx #level5_map.mape1_attrs LEVEL_ATTRS
    mwx LEVEL_MAP LEVEL_TRANS_MAP
    mvx #1 LEVEL_HAS_KEY
    rts
.endp

;
; level 5 map west 1
;   handles level 5 map west 1 loading
.proc level5_mapw1
    mvx #1 DISABLE_JOYSTICK
    mwx #level5_map.mapw1 LEVEL_MAP
    mwx #level5_map.mapw1_attrs LEVEL_ATTRS
    mwx LEVEL_MAP LEVEL_TRANS_MAP
    mvx #0 LEVEL_HAS_KEY
    rts
.endp

;
; level 5 map north 1
;   handles level map 5 north 1 loading
.proc level5_mapn1
    mvx #1 DISABLE_JOYSTICK
    mwx #level5_map.mapn1 LEVEL_MAP
    mwx #level5_map.mapn1_attrs LEVEL_ATTRS
    mwx LEVEL_MAP LEVEL_TRANS_MAP
    mvx #0 LEVEL_HAS_KEY
    rts
.endp

;
; level 5 map south 1
;   handles level 5 map south 1 loading
.proc level5_maps1
    mvx #1 DISABLE_JOYSTICK
    mwx #level5_map.maps1 LEVEL_MAP
    mwx #level5_map.maps1_attrs LEVEL_ATTRS
    mwx LEVEL_MAP LEVEL_TRANS_MAP
    mvx #0 LEVEL_HAS_KEY
    rts
.endp

;
; level 5 map south 1 west 1
;   handles level map 5 south 1 west 1 loading
.proc level5_maps1w1
    mvx #1 DISABLE_JOYSTICK
    mwx #level5_map.maps1w1 LEVEL_MAP
    mwx #level5_map.maps1w1_attrs LEVEL_ATTRS
    mwx LEVEL_MAP LEVEL_TRANS_MAP
    mvx #0 LEVEL_HAS_KEY
    rts
.endp

;
; level 6
;   handles level 6 loading
.proc level6
    mwx #level6_map.intro LEVEL_INTRO
    mwx #intro_music BGM_ADDR
    mwx #level6_map.map LEVEL_MAP
    mwx #level6_map.attrs LEVEL_ATTRS
    mvx #0 ITEMS
    mvx #1 LEVEL_HAS_KEY

    reset_coin_state #<level6_map.attrs #>level6_map.attrs
    reset_coin_state #<level6_map.mapn1_attrs #>level6_map.mapn1_attrs
    reset_coin_state #<level6_map.maps1_attrs #>level6_map.maps1_attrs
    reset_coin_state #<level6_map.maps1e1_attrs #>level6_map.maps1e1_attrs
    reset_coin_state #<level6_map.maps1w1_attrs #>level6_map.maps1w1_attrs

    display_game_intro()
    rts
.endp

;
; level 6
;   handles level 6 transition loading
.proc level6_main
    mvx #1 DISABLE_JOYSTICK
    mwx #level6_map.map LEVEL_MAP
    mwx #level6_map.attrs LEVEL_ATTRS
    mwx LEVEL_MAP LEVEL_TRANS_MAP
    mvx #1 LEVEL_HAS_KEY
    rts
.endp

;
; level 6 map north 1
;   handles level map 6 north 1 loading
.proc level6_mapn1
    mvx #1 DISABLE_JOYSTICK
    mwx #level6_map.mapn1 LEVEL_MAP
    mwx #level6_map.mapn1_attrs LEVEL_ATTRS
    mwx LEVEL_MAP LEVEL_TRANS_MAP
    mvx #0 LEVEL_HAS_KEY
    rts
.endp

;
; level 6 map south 1
;   handles level map 6 south 1 loading
.proc level6_maps1
    mvx #1 DISABLE_JOYSTICK
    mwx #level6_map.maps1 LEVEL_MAP
    mwx #level6_map.maps1_attrs LEVEL_ATTRS
    mwx LEVEL_MAP LEVEL_TRANS_MAP
    mvx #0 LEVEL_HAS_KEY
    rts
.endp

;
; level 6 map south 1 west 1
;   handles level map 6 south 1 west 1 loading
.proc level6_maps1w1
    mvx #1 DISABLE_JOYSTICK
    mwx #level6_map.maps1w1 LEVEL_MAP
    mwx #level6_map.maps1w1_attrs LEVEL_ATTRS
    mwx LEVEL_MAP LEVEL_TRANS_MAP
    mvx #0 LEVEL_HAS_KEY
    rts
.endp

;
; level 6 map south 1 east 1
;   handles level map 6 south 1 east 1 loading
.proc level6_maps1e1
    mvx #1 DISABLE_JOYSTICK
    mwx #level6_map.maps1e1 LEVEL_MAP
    mwx #level6_map.maps1e1_attrs LEVEL_ATTRS
    mwx LEVEL_MAP LEVEL_TRANS_MAP
    mvx #0 LEVEL_HAS_KEY
    rts
.endp

;
; congratulations
;   handles congratulations level loading
.proc congratulations
    mwx #congratulations_map.intro LEVEL_INTRO
    mwx #wingame_music BGM_ADDR
    mvx #0 LEVEL_MAP
    mvx #0 ITEMS
    mvx #0 LEVEL_HAS_KEY

    ldx WIN_COUNT
    cpx #4
    bne increment_win
    jmp speed
increment_win
    inc WIN_COUNT

speed
    ldx ENEMY_SPEED_RES
    cpx #0
    bne increase_speed
    jmp display

increase_speed
    dec ENEMY_SPEED_RES

display
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
    play_exit_level_sound()
    jmp (NEXT_LEVEL)

done
    rts
.endp

;
; reset coin state
;   resets current coin state for a map
.proc reset_coin_state (.byte attrl+1, attrh+1) .var
attrl mvx #0 TMP0
attrh mvx #0 TMP1
attr=TMP0

    ldy #0

    iny ; count
    lda (attr),y+
    tax

    lda #$ff
loop
    sta (attr),y+
    dex
    bne loop

    rts
.endp
