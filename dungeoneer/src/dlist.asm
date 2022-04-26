; dlist.asm
;	handles the display list for screen elements

;
; setup display list for screen
;
.proc setup_game_screen
BLANK8=$70 ; 8 blank lines
BLANK7=$60 ; 7 blank lines
LMS=$40 ; load memory scan (LMS)
JVB=$41 ; jump vertical black (JVB)
DLI=$80 ; display list interrupt
ANTIC5=$05 ; ANTIC mode 5

	mwa #dlist SDLSTL ; move word takes care of high/low byte assignments
	rts

; display list
dlist
	.byte BLANK8, BLANK8, BLANK7
	.byte DLI + LMS + ANTIC5
	.word item_screen
	.byte DLI + LMS + ANTIC5
	.word GAME_SCREEN
	.byte DLI + ANTIC5, DLI + ANTIC5, DLI + ANTIC5, DLI + ANTIC5, DLI + ANTIC5
	.byte DLI + ANTIC5, DLI + ANTIC5, DLI + ANTIC5, DLI + ANTIC5, DLI + ANTIC5
	.byte DLI + ANTIC5
	.byte JVB
	.word dlist
.endp

;
; setup game over / menu screen
;
.proc setup_menu_screen
BLANK8=$70 ; 8 blank lines
LMS=$40 ; load memory scan (LMS)
JVB=$41 ; jump vertical blank (JVB)
DLI=$80 ; display list interrupt
ANTIC5=5 ; ANTIC mode 5

	mwa #dlist SDLSTL ; move word takes care of high/low byte assignments
	rts

; display list
dlist
	.byte BLANK8, BLANK8, BLANK8
	.byte ANTIC5 + LMS
	.word MENU_SCREEN
	.byte DLI + ANTIC5, DLI + ANTIC5, DLI + ANTIC5, DLI + ANTIC5, DLI + ANTIC5
	.byte DLI + ANTIC5, DLI + ANTIC5, DLI + ANTIC5, DLI + ANTIC5, DLI + ANTIC5
	.byte DLI + ANTIC5
	.byte JVB
	.word dlist
.endp
