; Dungeoneer - A simple game in Atari 8-bit assembly

; References:
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
ITEM_SCREEN=$6000 ; item screen buffer

POSX=$c0 ; player x position on screen
POSY=$c1 ; player y position on screen
TILEX=$c2 ; the x tile position
TILEY=$c3 ; the y tile position
ONTILE=$c4 ; the current player tile
TILEPTRL=$c5 ; the tile pointer low byte
TILEPTRH=$c6 ; the tile pointer high byte
ITEMS=$d0 ; the picked up player items
TMP0=$e0 ; volatile temp storage 0
TMP1=$e1 ; volatile temp storage 1

	setup_screen()
	setup_colors()
	mva #>CHARSET CHBAS
	setup_pmg()
	display_screen_items()
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
	delay #255, #12

	jmp main_loop

	icl "hardware.asm"
	icl "dlist.asm"
	icl "pmg.asm"
	icl "joystick.asm"
	icl "tile.asm"
	icl "buffer.asm"
	icl "util.asm"
	icl "item.asm"
	icl "data/charset.data"
	icl "data/player.data"
	icl "data/map.data"

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
.endp
