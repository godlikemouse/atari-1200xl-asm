; dlist.asm
;	handles the display list for screen elements

;
; setup display list for screen
;
.proc setup_game_screen
antic5 = $05 ; ANTIC mode 5
blank8 = $70 ; 8 blank lines
blank7 = $60 ; 7 blank lines
lms = $40 ; load memory scan (LMS)
jvb = $41 ; jump vertical black (JVB)
dli = $80 ; display list interrupt

	mwx #dlist SDLSTL ; move word takes care of high/low byte assignments
	rts

; display list
dlist
	.byte blank8
	.byte blank8
	.byte blank7
	.byte dli + lms + antic5
	.word ITEM_SCREEN
	.byte dli + lms + antic5
	.word GAME_SCREEN
	.byte dli + antic5
	.byte dli + antic5
	.byte dli + antic5
	.byte dli + antic5
	.byte dli + antic5
	.byte dli + antic5
	.byte dli + antic5
	.byte dli + antic5
	.byte dli + antic5
	.byte dli + antic5
	.byte dli + antic5
	.byte jvb
	.word dlist
.endp

;
; setup game over / menu screen
;
.proc setup_menu_screen
antic5 = 5 ; ANTIC mode 5
blank8 = $70 ; 8 blank lines
lms = $40 ; load memory scan (LMS)
jvb = $41 ; jump vertical blank (JVB)
dli = $80 ; display list interrupt

	mwx #dlist SDLSTL ; move word takes care of high/low byte assignments
	rts

; display list
dlist
	.byte blank8
	.byte blank8
	.byte blank8
	.byte antic5 + lms
	.word MENU_SCREEN
	.byte dli + antic5
	.byte dli + antic5
	.byte dli + antic5
	.byte dli + antic5
	.byte dli + antic5
	.byte dli + antic5
	.byte dli + antic5
	.byte dli + antic5
	.byte dli + antic5
	.byte dli + antic5
	.byte dli + antic5
	.byte jvb
	.word dlist
.endp

;
; setup game over / menu screen
;
.proc setup_mainmenu_screen
antic5 = 5 ; ANTIC mode 5
blank8 = $70 ; 8 blank lines
lms = $40 ; load memory scan (LMS)
jvb = $41 ; jump vertical blank (JVB)
dli = $80 ; display list interrupt

	mwx #dlist SDLSTL ; move word takes care of high/low byte assignments
	rts

; display list
dlist
	.byte blank8
	.byte blank8
	.byte blank8
	.byte antic5 + lms
	.word MENU_SCREEN
	.byte dli + antic5
	.byte dli + antic5
	.byte dli + antic5
	.byte dli + antic5
	.byte dli + antic5
	.byte dli + antic5
	.byte dli + antic5
	.byte dli + antic5
	.byte dli + antic5
	.byte dli + antic5
	.byte dli + antic5
	.byte jvb
	.word dlist
.endp
