;
; setup colors
;
.proc setup_colors
black=$00
gray=$06
light_gray=$0a
green=$c4
brown=$24
peach=$3c
blue=$80

	; character set colors
	mva #gray COLOR0        ; %01
	mva #light_gray COLOR1  ; %10
	mva #brown COLOR2       ; %11
	mva #green COLOR3       ; %11 (inverse)
	mva #black COLOR4       ; %00

	; player-missile colors
	mva #brown PCOLR0
	mva #peach PCOLR1
	mva #blue  PCOLR2
	mva #black PCOLR3
	rts
.endp

;
; clear pmg
;
.proc clear_pmg
pmg_p0 = PMG + $200
pmg_p1 = PMG + $280
pmg_p2 = PMG + $300
pmg_p3 = PMG + $380

	ldx #$80
	lda #0

loop
	sta pmg_p0,x
	sta pmg_p1,x
	sta pmg_p2,x
	sta pmg_p3,x
	dex
	bne loop
	rts
.endp

;
; clear player vertical repaint
;
.proc clear_player_vertical
pmg_p0 = PMG + $200
pmg_p1 = PMG + $280
pmg_p2 = PMG + $300
pmg_p3 = PMG + $380

; clear bottom player row
	ldy #8
	lda POSY
	add #8
	tax
	lda #0

loop_bottom
	sta pmg_p0,x
	sta pmg_p1,x
	sta pmg_p2,x
	sta pmg_p3,x
	inx
	dey
	bne loop_bottom

; clear top player row
	ldy #8
	lda POSY
	sub #8
	tax
	lda #0

loop_top
	sta pmg_p0,x
	sta pmg_p1,x
	sta pmg_p2,x
	sta pmg_p3,x
	inx
	dey
	bne loop_top

	rts
.endp

;
; draw player
;
.proc draw_player
pmg_p0 = PMG + $200
pmg_p1 = PMG + $280
pmg_p2 = PMG + $300
pmg_p3 = PMG + $280

	ldx #0
	ldy POSY

loop
	mva player_data,x pmg_p0,y
	mva player_data+8,x pmg_p1,y
	mva player_data+16,x pmg_p2,y
	mva player_data+24,x pmg_p3,y
	iny
	inx
	cpx #8
	bne loop
	rts
.endp

;
; setup pmg
;
.proc setup_pmg
	mva #>pmg PMBASE
	mva #46 SDMCTL ; single line resolution
	mva #3 GRACTL ; enable PMG
	mva #1 GRPRIOR ; give players priority
	lda #$40
	sta POSY
	lda #$80
	sta POSX
	sta HPOSP0
	sta HPOSP1
	sta HPOSP2
	sta HPOSP3
	rts
.endp
