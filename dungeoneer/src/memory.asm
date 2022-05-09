; hardware.asm
;   Contains hardware related memory locations

RTCLOCK           = $0014 ; internal realtime clock
ATTRACT           = $004d ; attraction mode / screensaver
POSX              = $00c0 ; player x position on screen
POSY              = $00c1 ; player y position on screen
TILEX             = $00c2 ; the x tile position
TILEY             = $00c3 ; the y tile position
ONTILE            = $00c4 ; the current player tile
TILEPTR           = $00c5 ; the tile pointer
TILESET_ADDRESS   = $00c7 ; the animating tileset address
TILESPRITE        = $00c8 ; the tile sprite counter
TILESPRITE_INDEX  = $00c9 ; the tile sprite index (0, 1, 2)
TILESPRITE_ENABLE = $00ca ; enable tilesprite animation
PLAYER_SPRITE     = $00cb ; the player sprite index
PLAYANIM_OFFSET   = $00cc ; the player animation offset
PLAYER_DEATH      = $00cd ; the player death flag
PLAYER_RESET_POSX = $00ce ; the player reset posx
PLAYER_RESET_POSY = $00cf ; the player reset posy
ITEMS             = $00d0 ; the picked up player items (XXXXKKKK)
PLAYER_LIVES      = $00d1 ; the player lives
PLAYER_SCORE      = $00d2 ; player score
MENU_SELECTION    = $00d4 ; selected menu item
DISPLAY_TYPE      = $00d5 ; screen display type
INTRO_POSITION    = $00d6 ; intro screen player x position
GAMEOVER_POSITION = $00d7 ; game over position
LEVEL_MAP         = $00d8 ; game level map
LEVEL_INTRO       = $00da ; game level intro map
NEXT_LEVEL        = $00dc ; next level proc
DISABLE_JOYSTICK  = $00de ; disable joystick flag
TMP0              = $00e0 ; volatile temp storage 0
TMP1              = $00e1 ; volatile temp storage 1
TMP2              = $00e2 ; volatile temp storage 2
TMP3              = $00e3 ; volatile temp storage 3
TMP4              = $00e4 ; volatile temp storage 4
TMP5              = $00e5 ; volatile temp storage 5
TMP6              = $00e6 ; volatile temp storage 6
TMP7              = $00e7 ; volatile temp storage 7
TMP8              = $00e8 ; volatile temp storage 8
TMP9              = $00e9 ; volatile temp storage 9
TMP10             = $00ea ; volatile temp storage 10
TMP11             = $00eb ; volatile temp storage 11
TMP12             = $00ec ; volatile temp storage 12
TMP13             = $00ed ; volatile temp storage 13
TMP14             = $00ee ; volatile temp storage 14
TMP15             = $00ef ; volatile temp storage 15
BGM_COUNTER       = $00f0 ; background music counter
BGM_DATA_INDEX    = $00f1 ; background music data index
BGM_NOTE_SUSTAIN  = $00f2 ; background music note sustain
BGM_NOTE_SILENCE  = $00f3 ; background music note silence
BGM_ENABLE        = $00f4 ; enable background music
BGM_ADDR          = $00f5 ; background music address
SFX1              = $00f7 ; sound effect 1
SFX1_ADDR         = $00f8 ; sfx1 address
SFX1_COUNTER      = $00fa ; sfx1 counter
SFX1_DATA_INDEX   = $00fb ; sfx1 data index
SFX1_NOTE_SUSTAIN = $00fc ; sfx1 note sustain
SFX1_NOTE_SILENCE = $00fd ; sfx1 note silence
SFX2              = $00fe ; sound effect 2
SFX2_ADDR         = $00ff ; sfx2 address
SFX2_COUNTER      = $0101 ; sfx2 counter
SFX2_DATA_INDEX   = $0102 ; sfx2 data index
SFX2_NOTE_SUSTAIN = $0103 ; sfx2 note sustain
SFX2_NOTE_SILENCE = $0104 ; sfx2 note silence
SFX3              = $0105 ; sound effect 3
SFX3_ADDR         = $0106 ; sfx3 address
SFX3_COUNTER      = $0108 ; sfx3 counter
SFX3_DATA_INDEX   = $0109 ; sfx3 data index
SFX3_NOTE_SUSTAIN = $010a ; sfx3 note sustain
SFX3_NOTE_SILENCE = $010b ; sfx3 note silence
LEVEL_TRANS_N     = $010c ; level transition north address
LEVEL_TRANS_E     = $010e ; level transition east address
LEVEL_TRANS_S     = $0110 ; level transition south address
LEVEL_TRANS_W     = $0112 ; level transition west address
LEVEL_TRANS_X     = $0114 ; level transition x
LEVEL_TRANS_Y     = $0115 ; level transition y
LEVEL_TRANS_TYPE  = $0116 ; level transition type (3N, 4E, 5S, 6W)
LEVEL_TRANS_MAP   = $0117 ; level transition map address
SKIP_FRAME        = $0119 ; skip frame
RESTORE_KEY       = $011a ; restore key flag
RESTORE_COIN      = $011b ; restore coin flag
SEQUENCE          = $011c ; sequence pointer
LEVEL_HAS_KEY     = $011d ; level has key flag
KEY_POSX          = $011e ; key position x
KEY_POSY          = $011f ; key position y
CLOCK_PREV        = $0120 ; previous clock interval
ENEMY_POSX        = $0121 ; enemy position y
ENEMY_POSY        = $0122 ; enemy position y
ENEMY_DIR_X       = $0123 ; enmey direction x
ENEMY_DIR_Y       = $0124 ; enemy direction y
ENEMY_MOVE_INDEX  = $0125 ; enemy move index
ENEMY_SPRITE      = $0126 ; the enemy sprite index
ENEMANIM_OFFSET   = $0127 ; the enemy animation offset
ENEMY_SPEED_RES   = $0128 ; the enemy movement speed resistance
MENU_BTN_COUNT    = $0129 ; the menu button counter
WIN_COUNT         = $012a ; the game win counter
VTIMR1            = $0210 ; virtual timer 1
VVBLKD            = $0224 ; vertical blank interrupt return
SDMCTL            = $022f ; pm resolution 46 ($2E) = double line resolution
SDLSTL            = $0230 ; display list starting address
GRPRIOR           = $026f ; player-missile priority
STICK0            = $0278 ; joystick port 0
BTN0              = $0284 ; joystock port 0 button
COLOR0            = $02c4 ; color for %01
COLOR1            = $02c5 ; color for %10
COLOR2            = $02c6 ; color for %11 (normal)
COLOR3            = $02c7 ; color for %11 (inverse)
COLOR4            = $02c8 ; color for %00 (background)
PCOLR0            = $02c0 ; color for player-missile 0
PCOLR1            = $02c1 ; color for Player-missile 1
PCOLR2            = $02c2 ; color for player-missile 2
PCOLR3            = $02c3 ; color for player-missile 3
PCOLR4            = $02c4 ; color for player-missile 4
CHBAS             = $02f4 ; character base register
GAME_SCREEN       = $4000 ; game screen buffer
ITEM_SCREEN       = $41e0 ; item screen buffer
MENU_SCREEN       = $41fc ; game over / main menu screen address
PMG               = $4400 ; player missile graphics buffer
GAME_TILESET1     = $5000 ; tileset1 sprite address
GAME_TILESET2     = $5400 ; tileset2 sprite address
GAME_TILESET3     = $5800 ; tileset3 sprite address
MENU_TILESET1     = $6000 ; menu tileset address
MENU_TILESET2     = $6400 ; menu tileset address
MENU_TILESET3     = $6800 ; menu tileset address
HPOSP0            = $d000 ; horizontal position of player 0
HPOSP1            = $d001 ; horizontal position of player 1
HPOSP2            = $d002 ; horizontal position of player 2
HPOSP3            = $d003 ; horizontal position of player 3
HPOMS0            = $d004 ; horizontal position of missile 0
HPOMS1            = $d005 ; horizontal position of missile 1
HPOMS2            = $d006 ; horizontal position of missile 2
HPOMS3            = $d007 ; horizontal position of missile 3
M0PCOL            = $d008 ; missile 0 to player collision
M1PCOL            = $d009 ; missile 1 to player collision
M2PCOL            = $d00a ; missile 2 to player collision
M3PCOL            = $d00b ; missile 3 to player collision
SIZEM             = $d00c ; missile size
GRAFM             = $d011 ; missile graphics
COLPF3            = $d019 ; player 5 color
GRACTL            = $d01d ; enable/disable pmg
HITCLR            = $d01e ; hit clear register
AF1C              = $d200 ; FFFFFFFF ; F=Frequency
AC1C              = $d201 ; NNNvVVVV ; N=Noise, v=Volume only, V=Volume
AF2C              = $d202 ; FFFFFFFF ; F=Frequency
AC2C              = $d203 ; NNNvVVVV ; N=Noise, v=Volume only V=Volume
AF3C              = $d204 ; FFFFFFFF ; F=Frequency
AC3C              = $d205 ; NNNvVVVV ; N=Noise, v=Volume only V=Volume
AF4C              = $d206 ; FFFFFFFF ; F=Frequency
AC4C              = $d207 ; NNNvVVVV ; N=Noise, v=Volume only V=Volume
; N=17bit to 9bit poly-counter
; 1234=Clocks and Joins
;   1 Channel 1 clock to 1.79Mhz
;   2 Channel 3 clock to 1.79MHz
;   3 Join channels 1-2 16bit frequency
;   4 Join channels 3-4 16bit frequency
; HH=Channel 1, Channel 2 Highpass Filters
; S=64Khz to 15kHz
AUDCTL            = $d208 ; N1234HHS
RNDNUM            = $d20a ; random number
PACTL             = $d302 ; joystick port control
PMBASE            = $d407 ; player missile graphics base address
WSYNC             = $d40a ; wait sync
SETVBV            = $e45c ; set vertical blank interrupt vector
XITVBV            = $e462 ; vertical blank interrupt exit
