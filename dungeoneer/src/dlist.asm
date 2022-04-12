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

	mva #3 PLAYER_LIVES
	mwa #dlist SDLSTL ; move word takes care of high/low byte assignments
	rts

; display list
dlist
	.byte blank8, blank8, blank7
	.byte antic5 + LMS, <item_screen, >item_screen
	.byte antic5 + LMS, <SCREEN, >SCREEN
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
