; Dungeoneer - A simple game in Atari 8-bit assembly

; References and citations
;
; Based on the original 8bit MADS YouTube tutorial series by Ed Salisbury
; https://www.youtube.com/playlist?list=PL7IgmhqRiwzEIVAOhZWnby6WPsQ8alFSI
;
; Tile mapping and conversion handled by Tiled:
; https://www.mapeditor.org/
;
; NTSC Color Palette:
; https://atariage.com/forums/uploads/monthly_10_2015/post-6369-0-47505700-1443889945.png
;
; Atari Memory Map:
; https://www.atariarchives.org/mapping/memorymap.php
;
; PMG Memory Map:
; https://www.atariarchives.org/mapping/appendix7.php

; TODO: fix enemy clear pmg on level load
; TODO: fix enemy tile_is_block
; TODO: add spider animation
; TODO: add adjustable enemy movement speed
; TODO: increase spider speed on end game
; TODO: implement joystick nw 10, sw 9, ne 6, se 5

	org $0600

	; main setup
	setup_colors()
	enable_interrupts()
	display_mainmenu()

	; main loop
main
	sequence_sound_handler()
	transition_map_handler()
	restore_key_state()
    restore_coin_state()
	check_enemy_player_collision()
	jmp main

	icl "memory.asm"
	icl "dlist.asm"
	org $2000
	icl "level.asm"
	icl "pmg.asm"
	icl "enemy.asm"
	icl "joystick.asm"
	icl "util.asm"
	icl "item.asm"
	icl "interrupt.asm"
	icl "sound.asm"
	icl "map.asm"
	icl "transition.asm"
	icl "tile.asm"
	icl "data/game_tileset.asm"
	icl "data/menu_tileset.asm"
	icl "data/player.asm"
	icl "data/enemy.asm"
	icl "data/sound.asm"
	icl "display/gameover.asm"
	icl "display/mainmenu.asm"
	icl "display/level1.asm"
	icl "display/level2.asm"
	icl "display/level3.asm"
	icl "display/level4.asm"
	icl "display/level5.asm"
	icl "display/congratulations.asm"
