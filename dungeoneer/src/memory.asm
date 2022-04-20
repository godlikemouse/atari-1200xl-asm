; hardware.asm
;   Contains hardware related memory locations

POSX              = $00c0 ; player x position on screen
POSY              = $00c1 ; player y position on screen
TILEX             = $00c2 ; the x tile position
TILEY             = $00c3 ; the y tile position
ONTILE            = $00c4 ; the current player tile
TILEPTRL          = $00c5 ; the tile pointer low byte
TILEPTRH          = $00c6 ; the tile pointer high byte
TILESET_ADDRESS   = $00c7 ; the animating tileset address
TILESPRITE        = $00c8 ; the tile sprite counter
TILESPRITE_INDEX  = $00c9 ; the tile sprite index (0, 1, 2)
TILESPRITE_ENABLE = $00ca ; enable tilesprite animation
PLAYER_SPRITE     = $00cb ; the player sprite index
PLAYANIM_OFFSET   = $00cc ; the player animation offset
PLAYER_DEATH      = $00cd ; the player death flag
PLAYER_RESET_POSX = $00ce ; the player reset posx
PLAYER_RESET_POSY = $00cf ; the player reset posy
ITEMS             = $00d0 ; the picked up player items
PLAYER_LIVES      = $00d1 ; the player lives
PLAYER_SCOREL     = $00d2 ; player score low byte
PLAYER_SCOREH     = $00d3 ; player score high byte
MENU_SELECTION    = $00d4 ; selected menu item
DISPLAY_TYPE      = $00d5 ; screen display type
INTRO_POSITION    = $00d6 ; intro screen player x position
GAMEOVER_POSITION = $00d7 ; game over position
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
BGM_ADDRL         = $00f5 ; background music address low
BGM_ADDRH         = $00f6 ; background music address high
SFX1              = $00f7 ; sound effect 1
SFX1_ADDRL        = $00f8 ; sfx1 address low
SFX1_ADDRH        = $00f9 ; sfx1 address high
SFX1_COUNTER      = $00fa ; sound effect counter
SFX1_DATA_INDEX   = $00fb ; sound effect data index
SFX1_NOTE_SUSTAIN = $00fc ; sound effect note sustain
SFX1_NOTE_SILENCE = $00fd ; sound effect note silence
SFX2              = $00fe ; sound effect 1
SFX2_ADDRL        = $00ff ; sfx2 address low
SFX2_ADDRH        = $0100 ; sfx2 address high
SFX2_COUNTER      = $0101 ; sound effect counter
SFX2_DATA_INDEX   = $0102 ; sound effect data index
SFX2_NOTE_SUSTAIN = $0103 ; sound effect note sustain
SFX2_NOTE_SILENCE = $0104 ; sound effect note silence
GAME_SCREEN       = $3000 ; game screen buffer
ITEM_SCREEN       = $4000 ; item screen buffer
MENU_SCREEN       = $4028 ; game over / main menu screen address
PMG               = $5000 ; player missile graphics buffer
PMG_OFFSCRN       = $5500 ; player missile graphics offscreen
GAME_TILESET1     = $6000 ; tileset1 sprite address
GAME_TILESET2     = $6400 ; tileset2 sprite address
GAME_TILESET3     = $6800 ; tileset3 sprite address
MENU_TILESET1     = $7000 ; menu tileset address
MENU_TILESET2     = $7400 ; menu tileset address
MENU_TILESET3     = $7800 ; menu tileset address
VTIMR1            = $0210 ; Virtual Timer 1
VVBLKD            = $0224 ; Vertical Blank Interrupt Return
SDMCTL            = $022f ; PM Resolution 46 ($2E) = double line resolution
SDLSTL            = $0230 ; Display list starting address
GRPRIOR           = $026f ; Player-Missile Priority
STICK0            = $0278 ; joystick port 0
BTN0              = $0284 ; joystock port 0 button
COLOR0            = $02c4	; Color for %01
COLOR1            = $02c5 ; Color for %10
COLOR2            = $02c6 ; Color for %11 (normal)
COLOR3            = $02c7 ; Color for %11 (inverse)
COLOR4            = $02c8 ; Color for %00 (background)
PCOLR0            = $02c0 ; Color for Player-Missile 0
PCOLR1            = $02c1 ; Color for Player-Missile 1
PCOLR2            = $02c2 ; Color for Player-Missile 2
PCOLR3            = $02c3 ; Color for Player-Missile 3
CHBAS             = $02f4 ; Character Base Register
HPOSP0            = $d000 ; Horizontal position of player 0
HPOSP1            = $d001 ; Horizontal position of player 1
HPOSP2            = $d002 ; Horizontal position of player 2
HPOSP3            = $d003 ; Horizontal position of player 3
GRACTL            = $d01d ; Enable/disable PMG
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
PACTL             = $d302 ; joystick port control
PMBASE            = $d407 ; Player Missile Graphics Base address
WSYNC             = $d40a ; Wait Sync
SETVBV            = $e45c ; Set Vertical Blank Interrupt Vector
XITVBV            = $e462 ; Vertical Blank Interrupt Exit
