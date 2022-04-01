;
; can move left
;
.proc can_move_left
	store_ontile()
	tile_is_block()
	cmp #1
	beq done
	dec POSX
done
	rts
.endp

;
; can move right
;
.proc can_move_right
	store_ontile()
	tile_is_block()
	cmp #1
	beq done
	inc POSX
done
	rts
.endp

;
; can move up
;
.proc can_move_up
	store_ontile()
	tile_is_block()
	cmp #1
	beq done
	dec POSY
	clear_player_vertical()
done
	rts
.endp

;
; can move down
;
.proc can_move_down
	store_ontile()
	tile_is_block()
	cmp #1
	beq done
	inc POSY
	clear_player_vertical()
done
	rts
.endp

;
; read joystick
;
.proc read_joystick
UP=$0e
DOWN=$0d
LEFT=$0b
RIGHT=$07

	lda STICK0
	cmp #LEFT
	beq move_left
	cmp #RIGHT
	beq move_right
	cmp #UP
	beq move_up
	cmp #DOWN
	beq move_down
	rts

move_left
	; advance x position
	; determine next tile
	dec POSX
	adb POSY #4
	store_tilex()
	store_tiley()
	; restore position
	sbb POSY #4
	inc POSX
	; validate movement for block tiles
	can_move_left()
	copy_player_left()
	pickup_item()
	jmp store_posx

move_right
	; advance x position
	; determine next tile
	adb POSX #9
	adb POSY #4
	store_tilex()
	store_tiley()
	; restore position
	sbb POSX #9
	sbb POSY #4
	; validate movement for block tiles
	can_move_right()
	copy_player_right()
	pickup_item()
	jmp store_posx

move_up
	; advance y position
	; determine next tile
	dec POSY
	adb POSX #4
	store_tilex()
	store_tiley()
	; restore position
	sbb POSX #4
	inc POSY
	; validate movement for block tiles
	can_move_up()
	;clear_pmg()
	copy_player_left()
	pickup_item()
	rts

move_down
	; advance y position
	; determine next tile
	adb POSY #9
	adb POSX #4
	store_tilex()
	store_tiley()
	; restore position
	sbb POSX #4
	sbb POSY #9
	; validate movement for block tiles
	can_move_down()
	;clear_pmg()
	copy_player_right()
	pickup_item()
	rts

store_posx
	ldx POSX
	stx HPOSP0
	stx HPOSP1
	stx HPOSP2
	stx HPOSP3
	rts
.endp
