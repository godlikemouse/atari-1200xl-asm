; Dungeoneer - A simple game in Atari 8-bit assembly

; References:
; NTSC Color Palette: https://atariage.com/forums/uploads/monthly_10_2015/post-6369-0-47505700-1443889945.png
; PMG Memory Map: https://www.atarimagazines.com/compute/issue64/atari_animation.gif

; TODO: add door with key interaction
; TODO: add end of level interaction
; TODO: add transfer tile functionality
; TODO: implement joystick nw 10, sw 9, ne 6, se 5

	org $1000

	; main setup
	setup_colors()
	enable_interrupts()
	display_mainmenu()

	jmp *

	icl "memory.asm"
	icl "dlist.asm"
	icl "pmg.asm"
	icl "joystick.asm"
	icl "util.asm"
	icl "item.asm"
	icl "interrupt.asm"
	icl "sound.asm"
	icl "map.asm"
	icl "level.asm"
	icl "tile.asm"
	icl "data/game_tileset.asm"
	icl "data/menu_tileset.asm"
	icl "data/player.asm"
	icl "data/sound.asm"
	icl "display/gameover.asm"
	icl "display/mainmenu.asm"
	icl "display/level1.asm"
	icl "display/level2.asm"
