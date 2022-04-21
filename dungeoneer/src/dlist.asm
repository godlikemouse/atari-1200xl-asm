; dlist.asm
;	handles the display list for screen elements

;
; setup display list for screen
;
.proc setup_game_screen
blank8=$70 ; 8 blank lines
blank7=$60 ; 7 blank lines
LMS=$40 ; Load Memory Scan (LMS)
JVB=$41 ; Jump while vertical blank (JVB)
antic5=5 ; ANTIC mode 5
antic2=2 ; ANTIC mode 2

	mwa #dlist SDLSTL ; move word takes care of high/low byte assignments
	rts

; display list
dlist
	.byte blank8, blank8, blank7
	.byte antic5 + LMS, <item_screen, >item_screen
	.byte antic5 + LMS, <GAME_SCREEN, >GAME_SCREEN
	.byte antic5, antic5, antic5, antic5, antic5, antic5
	.byte antic5, antic5, antic5, antic5, antic5
	.byte JVB, <dlist, >dlist
.endp

;
; setup game over / menu screen
;
.proc setup_menu_screen
blank8=$70 ; 8 blank lines
LMS=$40 ; Load Memory Scan (LMS)
JVB=$41 ; Jump while vertical blank (JVB)
antic5=5 ; ANTIC mode 5

	mwa #dlist SDLSTL ; move word takes care of high/low byte assignments
	rts

; display list
dlist
	.byte blank8, blank8, blank8
	.byte antic5 + LMS, <MENU_SCREEN, >MENU_SCREEN
	.byte antic5, antic5, antic5, antic5, antic5, antic5
	.byte antic5, antic5, antic5, antic5, antic5
	.byte JVB, <dlist, >dlist
.endp

_A=$0302
_B=$0504
_C=$0606
_D=$0908
_E=$0b0a
_F=$0d0c
_G=$0f0e
_H=$1110
_I=$1312
_J=$1514
_K=$1716
_L=$1918
_M=$1b1a
_N=$1d1c
_O=$1f1e
_P=$2120
_Q=$2322
_R=$2524
_S=$2726
_T=$2928
_U=$2b2a
_V=$2d2c
_W=$2f2e
_X=$3130
_Y=$3332
_Z=$3534
