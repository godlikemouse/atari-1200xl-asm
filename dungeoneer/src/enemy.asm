; enemy.asm
;   handles enemy functinoality (player 5 - missile)

;
; draw enemy
;	combining 4 missiles into player 5
.proc draw_enemy
.var _limit .byte
missile = PMG + $180

	; load animation offset and set limit
	ldx ENEMANIM_OFFSET
	txa
	add #8
	sta _limit

	ldy ENEMY_POSY
loop
	mva enemy_data,x missile,y
	iny
	inx

	; verify offset limit
	txa
	cmp _limit
	bne loop
	rts
.endp

;
; animate enemy
;
.proc animate_enemy

	adb ENEMY_SPRITE #1
	cmp #5
    bne done

    mvx #0 ENEMY_SPRITE
    draw_enemy()
    adb ENEMANIM_OFFSET #$08
    cmp #$10
    bne done
    mvx #0 ENEMANIM_OFFSET

done
    rts
.endp

;
; reset enemy
; 	resets enemy chosen direction
.proc reset_enemy
	ldx #0
	stx ENEMY_DIR_X
	stx ENEMY_DIR_Y
	rts
.endp

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

	; show spider initially
	lda ENEMY_DIR_X
	ora ENEMY_DIR_Y
	cmp #0
	beq init

setup
	; check for currently in motion
	ldx ENEMY_MOVE_INDEX
	cpx #0
	bne direction_chosen
	enemy_choose_direction()
	jmp direction_chosen

init
	ldx #0
	stx ENEMANIM_OFFSET
	stx ENEMY_MOVE_INDEX
	draw_enemy()
	jmp setup

hide_enemy
	clear_enemy_pmg()
	ldx #0
	stx ENEMY_POSX
	stx ENEMY_POSY
	update_enemy_posx()
	rts

direction_chosen
	; wait until enemy speed resistance has elapsed

	; quick zero check first
	ldx ENEMY_SPEED_RES
	cpx #0
	beq move

	; normal check
	inc ENEMY_MOVE_INDEX
	lda ENEMY_MOVE_INDEX
	cmp ENEMY_SPEED_RES
	beq move
	jmp done

move
	mvx #0 ENEMY_MOVE_INDEX
	enemy_move_blocked()
	cmp #1
	beq reset

    animate_enemy()
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
	jmp done

move_east
	cmp #1
	bne move_south
	mvx #1 ENEMY_DIR_X
	mvx #0 ENEMY_DIR_Y
	jmp done

move_south
	cmp #2
	bne move_west
	mvx #0 ENEMY_DIR_X
	mvx #1 ENEMY_DIR_Y
	jmp done

move_west
	mvx #-1 ENEMY_DIR_X
	mvx #0 ENEMY_DIR_Y

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
