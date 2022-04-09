; dlist.asm
;	handles the display list for screen elements

;
; setup display list for screen
;
.proc setup_game

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
	.byte antic5 + LMS, <SCREEN, >SCREEN
	.byte antic5, antic5, antic5, antic5, antic5, antic5
	.byte antic5, antic5, antic5, antic5, antic5
	.byte JVB, <dlist, >dlist
.endp

;
; setup game over
; 	temporary game over screen
.proc setup_game_over
blank8=$70 ; 8 blank lines
blank7=$60 ; 7 blank lines
LMS=$40 ; Load Memory Scan (LMS)
JVB=$41 ; Jump while vertical blank (JVB)

antic5=5 ; ANTIC mode 5
antic2=2 ; ANTIC mode 2

	mwa #dlist SDLSTL ; move word takes care of high/low byte assignments
	mva #0 COLOR2
	mva #0 GRACTL
	mva #0 SDMCTL
	mva #$e0 CHBAS
	rts

; display list
dlist
	.byte blank8, blank8, blank8
	.byte $42, $20, $7c
	.byte antic2, antic2, antic2, antic2, antic2, antic2
	.byte antic2, antic2, antic2, antic2, antic2, antic2
	.byte antic2, antic2, antic2, antic2, antic2, antic2
	.byte antic2, antic2, antic2, antic2, antic2
	.byte antic2, antic2, antic2
	.byte JVB, <dlist, >dlist
.endp
