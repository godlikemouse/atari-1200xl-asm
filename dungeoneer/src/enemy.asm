; enemy.asm
;   handles enemy functinoality (player 5 - missile)

;
; render enemy
;
.proc render_enemy

	; render only on game screen
	ldx DISPLAY_TYPE
	cpx #2
	bne hide_enemy

	; hide enemy if off playing field
	ldx ENEMY_POSX
	cpx #0
	beq hide_enemy

	; check for currently in motion
	ldx ENEMY_MOVE_INDEX
	cpx #0
	bne direction_chosen
	enemy_choose_direction()
	jmp direction_chosen

hide_enemy
	clear_enemy_pmg()
	ldx #0
	stx ENEMY_POSX
	stx ENEMY_POSY
	update_enemy_posx()
	rts

direction_chosen
	; move in direction for 8 positions
	dec ENEMY_MOVE_INDEX
	lda ENEMY_MOVE_INDEX
	and #1
	bne move
	jmp done

move
	enemy_move_blocked()
	cmp #1
	beq reset

	adb ENEMY_POSX ENEMY_DIR_X
	adb ENEMY_POSY ENEMY_DIR_Y

	update_enemy_posx()
	clear_enemy_vertical()
	draw_enemy()
	jmp done

reset
	ldx #0
	stx ENEMY_MOVE_INDEX
	stx ENEMY_DIR_X
	stx ENEMY_DIR_Y

done
	rts
.endp

;
; enemy choose direction
;
.proc enemy_choose_direction
_move_count=8

	; choose a direction
	lda ENEMY_DIR_X
	ora ENEMY_DIR_Y
	cmp #0
	bne done
	lda RNDNUM
	:6 lsr

move_north
	cmp #0
	bne move_east
	mvx #0 ENEMY_DIR_X
	mvx #-1 ENEMY_DIR_Y
	mvx #_move_count ENEMY_MOVE_INDEX
	jmp done

move_east
	cmp #1
	bne move_south
	mvx #1 ENEMY_DIR_X
	mvx #0 ENEMY_DIR_Y
	mvx #_move_count ENEMY_MOVE_INDEX
	jmp done

move_south
	cmp #2
	bne move_west
	mvx #0 ENEMY_DIR_X
	mvx #1 ENEMY_DIR_Y
	mvx #_move_count ENEMY_MOVE_INDEX
	jmp done

move_west
	mvx #-1 ENEMY_DIR_X
	mvx #0 ENEMY_DIR_Y
	mvx #_move_count ENEMY_MOVE_INDEX

done
	rts
.endp

;
; enemy move blocked
;	returns acc == 1 if true, else acc == 0
.proc enemy_move_blocked

	jmp north

exit
	rts

north
	ldx ENEMY_DIR_Y
	cpx #-1
	bne south
	peek_enemy_position #0 #-1
	tile_is_enemy_block()
	cmp #1
	beq exit
	peek_enemy_position #7 #-1
	tile_is_enemy_block()
	cmp #1
	beq exit

south
	cpx #1
	bne east
	peek_enemy_position #0 #8
	tile_is_enemy_block()
	cmp #1
	beq exit
	peek_enemy_position #7 #8
	tile_is_enemy_block()
	cmp #1
	beq exit

east
	ldx ENEMY_DIR_X
	cpx #1
	bne west
	peek_enemy_position #8 #0
	tile_is_enemy_block()
	cmp #1
	beq done
	peek_enemy_position #8 #7
	tile_is_enemy_block()
	cmp #1
	beq done

west
	cpx #-1
	bne done
	peek_enemy_position #-1 #0
	tile_is_enemy_block()
	cmp #1
	beq done
	peek_enemy_position #-1 #7
	tile_is_enemy_block()
	cmp #1
	beq done

	lda #0

done
	rts
.endp

;
; set enemy pos
;	sets the enmy position
.proc update_enemy_posx
	lda ENEMY_POSX
	sta HPOMS3
	add #2
	sta HPOMS2
	add #2
	sta HPOMS1
	add #2
	sta HPOMS0
	rts
.endp

;
; check enemy player collision
;
.proc check_enemy_player_collision

	ldx PLAYER_DEATH
	cpx #0
	bne done

	ldx M0PCOL
	cpx #0
	bne hit

	ldx M1PCOL
	cpx #0
	bne hit

	ldx M2PCOL
	cpx #0
	bne hit

	ldx M3PCOL
	cpx #0
	bne hit

	jmp done

hit
	player_died()

done
	mvx #0 HITCLR
	rts
.endp
