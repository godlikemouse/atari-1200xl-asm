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

_A=$02
_B=$04
_C=$06
_D=$08
_E=$0a
_F=$0c
_G=$0e
_H=$10
_I=$12
_J=$14
_K=$16
_L=$18
_M=$1a
_N=$1c
_O=$1e
_P=$20
_Q=$22
_R=$24
_S=$26
_T=$28
_U=$2a
_V=$2c
_W=$2e
_X=$30
_Y=$32
_Z=$34
