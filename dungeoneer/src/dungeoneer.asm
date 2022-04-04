; Dungeoneer - A simple game in Atari 8-bit assembly

; References:
; ATASCII Table: https://www.atariwiki.org/wiki/attach/Atari%20ATASCII%20Table/ascii_atascii_table.pdf
; ATASCII 0-31 screen code 64-95
; ATASCII 32-95 screen code 0-63
; ATASCII 96-127 screen code 96-127
; NTSC Color Palette: https://atariage.com/forums/uploads/monthly_10_2015/post-6369-0-47505700-1443889945.png
; PMG Memory Map: https://www.atarimagazines.com/compute/issue64/atari_animation.gif

; TODO: write player sprite engine
; TODO: change player single point collision to bounding box

	org $0600

SCREEN=$3000 ; screen buffer
ITEM_SCREEN=$4000 ; item screen buffer
PMG=$5000 ; player missile graphics buffer
PMG_OFFSCRN=$5500 ; player missile graphics offscreen
TILESET1=$6000 ; tileset1 sprite address
TILESET2=$6400 ; tileset2 sprite address
TILESET3=$6800 ; tileset3 sprite address
POSX=$c0 ; player x position on screen
POSY=$c1 ; player y position on screen
TILEX=$c2 ; the x tile position
TILEY=$c3 ; the y tile position
ONTILE=$c4 ; the current player tile
TILEPTRL=$c5 ; the tile pointer low byte
TILEPTRH=$c6 ; the tile pointer high byte
TILESPRITE=$c7 ; the tile sprite index
ITEMS=$d0 ; the picked up player items
TMP0=$e0 ; volatile temp storage 0
TMP1=$e1 ; volatile temp storage 1
TMP2=$e2 ; volatile temp storage 2
TMP3=$e3 ; volatile temp storage 3
TMP4=$e4 ; volatile temp storage 4
TMP5=$e5 ; volatile temp storage 5
BGM_COUNTER=$f0
BGM_DATA_INDEX=$f1
BGM_NOTE_SUSTAIN=$f2
BGM_NOTE_SILENCE=$f3
SFX1=$f4
SFX1_COUNTER=$f5
SFX1_DATA_INDEX=$f5
SFX1_NOTE_SUSTAIN=$f6
SFX1_NOTE_SILENCE=$f7


	setup_sound()
	setup_screen()
	setup_colors()
	mva #>TILESET1 CHBAS
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

	; enable interrupt
    ldy #<vvblkd_interrupt
    ldx #>vvblkd_interrupt
    lda #7
    jsr SETVBV

vvblkd_interrupt
	lda #<vvblkd_chain
	sta VVBLKD
	lda #>vvblkd_chain
	sta VVBLKD+1

	jmp *

	icl "hardware.asm"
	icl "dlist.asm"
	icl "pmg.asm"
	icl "joystick.asm"
	icl "tile.asm"
	icl "buffer.asm"
	icl "util.asm"
	icl "item.asm"
	icl "sound.asm"
	icl "data/tileset.data"
	icl "data/player.data"
	icl "data/sound.data"
	icl "data/map.data"

;
; display map
;
.proc display_map

	ldx #0
	lda #$ff
	sta TILESPRITE

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

;
; vvblkd chain
;	method chains for VVBLKD interupts
.local vvblkd_chain
	read_joystick()
	animate_tilesprite()
	play_background_music()
	play_sfx SFX1, AF1C
	jmp XITVBV
.endl

;
; animate tilesprite
; 	animate map tile sprites
.proc animate_tilesprite
	inc TILESPRITE
	ldx TILESPRITE

	cpx #10
	bne done
	ldx #$ff
	stx TILESPRITE

	adb CHBAS #4
	lda CHBAS
	cmp #>TILESET1+12
	beq reset

	sta CHBAS
	jmp done
reset
	mva #>TILESET1 CHBAS
done
	rts
.endp
