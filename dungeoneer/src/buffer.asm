;
; clear pmg buffer
;
.proc clear_buffer

	ldx #$40
	lda #0

loop
	sta PMG_OFFSCRN,x
	dex
	bne loop
	rts
.endp

;
; setup pmg buffer
;
.proc setup_buffer
pmg_p0 = PMG + $200
pmg_p1 = PMG + $280
pmg_p2 = PMG + $300
pmg_p3 = PMG + $380

	ldy POSY
	ldx #0

loop
	; copy player to player offscreen
	mva pmg_p0,y PMG_OFFSCRN,x
	mva pmg_p1,y PMG_OFFSCRN+$08,x
	mva pmg_p2,y PMG_OFFSCRN+$10,x
	mva pmg_p3,y PMG_OFFSCRN+$18,x

	; copy player offscreen to reverse player offscreen
	mva PMG_OFFSCRN,x PMG_OFFSCRN+$20,x
	mva PMG_OFFSCRN+$08,x PMG_OFFSCRN+$28,x
	mva PMG_OFFSCRN+$10,x PMG_OFFSCRN+$30,x
	mva PMG_OFFSCRN+$18,x PMG_OFFSCRN+$38,x

	iny
	inx
	cpx #8
	bne loop
	rts
.endp

;
; reverse player buffer
;
.proc reverse_buffer

	ldx #0

loop

	ldy #8
reverse_loop
	ror PMG_OFFSCRN+$20,x
	rol PMG_OFFSCRN+$40,x
	ror PMG_OFFSCRN+$28,x
	rol PMG_OFFSCRN+$48,x
	ror PMG_OFFSCRN+$30,x
	rol PMG_OFFSCRN+$50,x
	ror PMG_OFFSCRN+$38,x
	rol PMG_OFFSCRN+$58,x
	dey
	bne reverse_loop

	lda PMG_OFFSCRN+$40,x
	sta PMG_OFFSCRN+$20,x
	lda PMG_OFFSCRN+$48,x
	sta PMG_OFFSCRN+$28,x
	lda PMG_OFFSCRN+$50,x
	sta PMG_OFFSCRN+$30,x
	lda PMG_OFFSCRN+$58,x
	sta PMG_OFFSCRN+$38,x

	inx
	cpx #8
	bne loop

	rts
.endp

;
; copy buffer left
;
.proc copy_player_left
pmg_p0 = PMG + $200
pmg_p1 = PMG + $280
pmg_p2 = PMG + $300
pmg_p3 = PMG + $380

	ldx #0
	ldy POSY

loop
	mva PMG_OFFSCRN+$20,x pmg_p0,y
	mva PMG_OFFSCRN+$28,x pmg_p1,y
	mva PMG_OFFSCRN+$30,x pmg_p2,y
	mva PMG_OFFSCRN+$38,x pmg_p3,y
	iny
	inx
	cpx #8
	bne loop
	rts
.endp

;
; copy buffer right
;
.proc copy_player_right
pmg_p0 = PMG + $200
pmg_p1 = PMG + $280
pmg_p2 = PMG + $300
pmg_p3 = PMG + $380

	ldx #0
	ldy POSY

loop
	mva PMG_OFFSCRN,x pmg_p0,y
	mva PMG_OFFSCRN+$8,x pmg_p1,y
	mva PMG_OFFSCRN+$10,x pmg_p2,y
	mva PMG_OFFSCRN+$18,x pmg_p3,y
	iny
	inx
	cpx #8
	bne loop
	rts
.endp
