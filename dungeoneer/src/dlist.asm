; dlist.asm
;	handles the display list for screen elements

;
; setup display list for screen
;
.proc setup_game_screen
_antic5=$05 ; ANTIC mode 5
_blank8=$70 ; 8 blank lines
_blank7=$60 ; 7 blank lines
_lms=$40 ; load memory scan (LMS)
_jvb=$41 ; jump vertical black (JVB)
_dli=$80 ; display list interrupt

	mwx #dlist SDLSTL ; move word takes care of high/low byte assignments
	rts

; display list
dlist
	.byte _blank8
	.byte _blank8
	.byte _blank7
	.byte _dli + _lms + _antic5
	.word ITEM_SCREEN
	.byte _dli + _lms + _antic5
	.word GAME_SCREEN
	.byte _dli + _antic5
	.byte _dli + _antic5
	.byte _dli + _antic5
	.byte _dli + _antic5
	.byte _dli + _antic5
	.byte _dli + _antic5
	.byte _dli + _antic5
	.byte _dli + _antic5
	.byte _dli + _antic5
	.byte _dli + _antic5
	.byte _dli + _antic5
	.byte _jvb
	.word dlist
.endp

;
; setup game over / menu screen
;
.proc setup_menu_screen
_antic5=5 ; ANTIC mode 5
_blank8=$70 ; 8 blank lines
_lms=$40 ; load memory scan (LMS)
_jvb=$41 ; jump vertical blank (JVB)
_dli=$80 ; display list interrupt

	mwx #dlist SDLSTL ; move word takes care of high/low byte assignments
	rts

; display list
dlist
	.byte _blank8
	.byte _blank8
	.byte _blank8
	.byte _antic5 + _lms
	.word MENU_SCREEN
	.byte _dli + _antic5
	.byte _dli + _antic5
	.byte _dli + _antic5
	.byte _dli + _antic5
	.byte _dli + _antic5
	.byte _dli + _antic5
	.byte _dli + _antic5
	.byte _dli + _antic5
	.byte _dli + _antic5
	.byte _dli + _antic5
	.byte _dli + _antic5
	.byte _jvb
	.word dlist
.endp

;
; setup game over / menu screen
;
.proc setup_mainmenu_screen
_antic5=5 ; ANTIC mode 5
_blank8=$70 ; 8 blank lines
_lms=$40 ; load memory scan (LMS)
_jvb=$41 ; jump vertical blank (JVB)
_dli=$80 ; display list interrupt

	mwx #dlist SDLSTL ; move word takes care of high/low byte assignments
	rts

; display list
dlist
	.byte _blank8
	.byte _blank8
	.byte _blank8
	.byte _antic5 + _lms
	.word MENU_SCREEN
	.byte _dli + _antic5
	.byte _dli + _antic5
	.byte _dli + _antic5
	.byte _dli + _antic5
	.byte _dli + _antic5
	.byte _dli + _antic5
	.byte _dli + _antic5
	.byte _dli + _antic5
	.byte _dli + _antic5
	.byte _dli + _antic5
	.byte _dli + _antic5
	.byte _jvb
	.word dlist
.endp
