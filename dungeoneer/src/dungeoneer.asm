; Dungeoneer - A simple game in Atari 8-bit assembly

	org $0600

	; main setup
	initialize_zeropage()
	setup_colors()
	enable_interrupts()
	setup_pmg()

	; delay initialization until after first vblank
init_delay
	ldx VBLANK_LOADED
	cpx #1
	bne init_delay

	display_mainmenu()

	; main loop
main
	sequence_sound_handler()
	transition_map_handler()
	restore_coin_state()
	restore_key_state()
	check_enemy_player_collision()
	mvx #0 ATTRACT
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
	icl "data/player.asm"
	icl "data/enemy.asm"
	icl "data/game_tileset.asm"
	icl "data/menu_tileset.asm"
	icl "data/sound.asm"
	icl "display/gameover.asm"
	icl "display/mainmenu.asm"
	icl "display/howtoplay.asm"
	icl "display/credits.asm"
	icl "display/level1.asm"
	icl "display/level2.asm"
	icl "display/level3.asm"
	icl "display/level4.asm"
	icl "display/level5.asm"
	icl "display/level6.asm"
	icl "display/congratulations.asm"
