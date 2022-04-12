; Dungeoneer - A simple game in Atari 8-bit assembly

; References:
; NTSC Color Palette: https://atariage.com/forums/uploads/monthly_10_2015/post-6369-0-47505700-1443889945.png
; PMG Memory Map: https://www.atarimagazines.com/compute/issue64/atari_animation.gif

; TODO: optimize player sprite set
; TODO: add death sound
; TODO: play game over music
; TODO: add menu screen
; TODO: clean reset player after death
; TODO: add door with key interaction
; TODO: add door with key proxy interaction
; TODO: add end of level interaction
; TODO: implement joystick nw 10, sw 9, ne 6, se 5

	org $0600

SCREEN=$3000 ; screen buffer
ITEM_SCREEN=$4000 ; item screen buffer
MENU_SCREEN=$4028 ; game over / main menu screen address
PMG=$5000 ; player missile graphics buffer
PMG_OFFSCRN=$5500 ; player missile graphics offscreen
GAME_TILESET1=$6000 ; tileset1 sprite address
GAME_TILESET2=$6400 ; tileset2 sprite address
GAME_TILESET3=$6800 ; tileset3 sprite address
MENU_TILESET1=$7000 ; menu tileset address
MENU_TILESET2=$7400 ; menu tileset address
MENU_TILESET3=$7800 ; menu tileset address
POSX=$c0 ; player x position on screen
POSY=$c1 ; player y position on screen
TILEX=$c2 ; the x tile position
TILEY=$c3 ; the y tile position
ONTILE=$c4 ; the current player tile
TILEPTRL=$c5 ; the tile pointer low byte
TILEPTRH=$c6 ; the tile pointer high byte
TILESET_ADDRESS=$c7 ; the animating tileset address
TILESPRITE=$c8 ; the tile sprite counter
TILESPRITE_INDEX=$c9 ; the tile sprite index (0, 1, 2)
TILESPRITE_ENABLE=$ca ; enable tilesprite animation
PLAYER_SPRITE=$cb ; the player sprite index
PLAYANIM_OFFSET=$cc ; the player animation offset
ITEMS=$d0 ; the picked up player items
PLAYER_LIVES=$d1 ; the player lives
ENABLE_INPUT=$d2 ; enable user controls
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
BGM_ENABLE=$f4 ; enable background music
BGM_ADDRL=$f5
BGM_ADDRH=$f6
SFX1=$f7 ; sound effect 1
SFX1_ADDRL=$f8
SFX1_ADDRH=$f9
SFX1_COUNTER=$fa ; sound effect counter
SFX1_DATA_INDEX=$fb ; sound effect data index
SFX1_NOTE_SUSTAIN=$fc ; sound effect note sustain
SFX1_NOTE_SILENCE=$fd ; sound effect note silence
SFX2=$fe ; sound effect 1
SFX2_ADDRL=$ff
SFX2_ADDRH=$100
SFX2_COUNTER=$101 ; sound effect counter
SFX2_DATA_INDEX=$102 ; sound effect data index
SFX2_NOTE_SUSTAIN=$103 ; sound effect note sustain
SFX2_NOTE_SILENCE=$104 ; sound effect note silence

	; main setup
	setup_sound()
	setup_game_screen()
	setup_colors()
	setup_tileset()
	setup_pmg()
	display_screen_items()
	display_player_lives()
	display_game_map()
	clear_pmg()
	draw_player()
	store_tilex()
	store_tiley()
	enable_interrupts()
	;display_mainmenu()

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
	icl "data/game_tileset.asm"
	icl "data/menu_tileset.asm"
	icl "data/player.asm"
	icl "data/sound.asm"
	icl "data/map.asm"
	icl "data/gameover.asm"
	icl "data/mainmenu.asm"
