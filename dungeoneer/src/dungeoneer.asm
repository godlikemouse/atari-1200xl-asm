; Dungeoneer - A simple game in Atari 8-bit assembly

; References:
; ATASCII Table: https://www.atariwiki.org/wiki/attach/Atari%20ATASCII%20Table/ascii_atascii_table.pdf
; ATASCII 0-31 screen code 64-95
; ATASCII 32-95 screen code 0-63
; ATASCII 96-127 screen code 96-127
; NTSC Color Palette: https://atariage.com/forums/uploads/monthly_10_2015/post-6369-0-47505700-1443889945.png
; PMG Memory Map: https://www.atarimagazines.com/compute/issue64/atari_animation.gif

; TODO: add lives to item screen
; TODO: add door with key interaction
; TODO: add door with key proxy interaction
; TODO: add end of level interaction
; TODO: implement joystick nw, ne, sw, se - nw 10,sw 9,ne 6,se 5

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
PLAYER_SPRITE=$c8 ; the player sprite index
PLAYANIM_OFFSET=$c9 ; the player animation offset
ITEMS=$d0 ; the picked up player items
PLAYER_LIVES=$d1 ; the player lives
TMP0=$e0 ; volatile temp storage 0
TMP1=$e1 ; volatile temp storage 1
TMP2=$e2 ; volatile temp storage 2
TMP3=$e3 ; volatile temp storage 3
TMP4=$e4 ; volatile temp storage 4
TMP5=$e5 ; volatile temp storage 5
TMP6=$e6 ; volatile temp storage 6
BGM_COUNTER=$f0 ; background music counter
BGM_DATA_INDEX=$f1 ; background music data index
BGM_NOTE_SUSTAIN=$f2 ; background music note sustain
BGM_NOTE_SILENCE=$f3 ; background music note silence
SFX1=$f4 ; sound effect 1
SFX1_COUNTER=$f5 ; sound effect counter
SFX1_DATA_INDEX=$f5 ; sound effect data index
SFX1_NOTE_SUSTAIN=$f6 ; sound effect note sustain
SFX1_NOTE_SILENCE=$f7 ; sound effect note silence

	; main setup
	mva #3 PLAYER_LIVES
	setup_sound()
	setup_screen()
	setup_colors()
	setup_tileset()
	setup_pmg()
	display_screen_items()
	display_player_lives()
	display_tileset()
	clear_pmg()
	draw_player()
	store_tilex()
	store_tiley()
	enable_interrupts()

	jmp *

	icl "hardware.asm"
	icl "dlist.asm"
	icl "pmg.asm"
	icl "joystick.asm"
	icl "tile.asm"
	icl "util.asm"
	icl "item.asm"
	icl "interrupt.asm"
	icl "sound.asm"
	icl "data/tileset.asm"
	icl "data/player.asm"
	icl "data/sound.asm"
	icl "data/map.asm"
