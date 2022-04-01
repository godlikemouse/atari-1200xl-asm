; Adventure - An Adventure in Atari 8-bit assembly
; Assemble: mads -l -t main.asm

; ATASCII Table: https://www.atariwiki.org/wiki/attach/Atari%20ATASCII%20Table/ascii_atascii_table.pdf
; ATASCII 0-31 screen code 64-95
; ATASCII 32-95 screen code 0-63
; ATASCII 96-127 screen code 96-127
; NTSC Color Palette: https://atariage.com/forums/uploads/monthly_10_2015/post-6369-0-47505700-1443889945.png
; PMG Memory Map: https://www.atarimagazines.com/compute/issue64/atari_animation.gif

	org $0600

SCREEN=$3000 ; screen buffer
CHARSET=$4000 ; character set address
PMG=$5000 ; player missile graphics buffer
PMG_OFFSCRN=$5500 ; player missile graphics offscreen

POSX=$c0
POSY=$c1
TILEX=$c2
TILEY=$c3
ONTILE=$c4
TILEPTRL=$c5
TILEPTRH=$c6
ITEMS=$d0
TMP0=$e0
TMP1=$e1

	setup_screen()
	setup_colors()
	mva #>CHARSET CHBAS
	setup_pmg()
	display_map()
	clear_pmg()
	draw_player()
	store_tilex()
	store_tiley()
	clear_buffer()
	setup_buffer()
	reverse_buffer()

main_loop

	read_joystick()

;movement delay loop
	ldx #255
	ldy #12
delay_loop
delay_loop2
	nop
	dex
	bne delay_loop2
	nop
	dey
	bne delay_loop

	jmp main_loop

	icl "hardware.asm"
	icl "dlist.asm"
	icl "joystick.asm"
	icl "tile.asm"
	icl "buffer.asm"
	icl "util.asm"
	icl "item.asm"
	icl "gfx.asm"
	icl "pmgdata.asm"

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

;
; display map
;
.proc display_map
	ldx #0

loop
	mva map,x SCREEN,x
	mva map+40,x SCREEN+40,x
	mva map+80,x SCREEN+80,x
	mva map+120,x SCREEN+120,x
	mva map+160,x SCREEN+160,x
	mva map+200,x SCREEN+200,x
	mva map+240,x SCREEN+240,x
	mva map+280,x SCREEN+280,x
	mva map+320,x SCREEN+320,x
	mva map+360,x SCREEN+360,x
	mva map+400,x SCREEN+400,x
	mva map+440,x SCREEN+440,x

	inx
	cpx #40
	bne loop
	rts

map
		.byte 32,33,32,33,32,33,32,33,32,33,32,33,32,33,32,33,32,33,32,33,32,33,32,33,32,33,32,33,32,33,32,33,32,33,32,33,32,33,12,13
		.byte 32,33,2,3,4,5,4,5,4,5,4,5,4,5,4,5,4,5,4,5,4,5,4,5,4,5,4,5,4,5,4,5,4,5,4,5,32,33,6,7
		.byte 32,33,6,7,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,32,33,6,7
		.byte 32,33,6,7,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,32,33,6,7
		.byte 32,33,6,7,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,32,33,6,7
		.byte 32,33,6,7,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,32,33,6,7
		.byte 32,33,6,7,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,32,33,32,33,32,33,32,33,32,33,6,7
		.byte 32,33,6,7,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,32,33,12,13,48,49,50,51,32,33,6,7
		.byte 32,33,6,7,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,192,193,0,1,0,1,0,1,32,33,6,7,0,1,0,1,32,33,6,7
		.byte 32,33,6,7,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,32,33,6,7,0,1,80,81,32,33,6,7
		.byte 32,33,32,33,32,33,32,33,32,33,32,33,32,33,32,33,32,33,32,33,32,33,32,33,32,33,32,33,32,33,32,33,32,33,32,33,32,33,6,7
		.byte 10,11,4,5,4,5,4,5,4,5,4,5,4,5,4,5,4,5,4,5,4,5,4,5,4,5,4,5,4,5,4,5,4,5,4,5,4,5,8,9
.endp
