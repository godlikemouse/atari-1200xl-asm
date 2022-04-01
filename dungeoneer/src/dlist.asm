;
; setup display list for screen
;
.proc setup_screen

blank8=$70 ; eight blank lines
LMS=$40 ; Load Memory Scan (LMS)
JVB=$41 ; Jump while vertical blank (JVB)

antic5=5 ; ANTIC mode 5
antic2=2 ; ANTIC mode 2

	mwa #dlist SDLSTL ; move word takes care of high/low byte assignments
	rts

; display list
dlist
	.byte blank8, blank8, blank8
	.byte antic5 + LMS, <screen, >screen
	.byte antic5, antic5, antic5, antic5, antic5, antic5
	.byte antic5, antic5, antic5, antic5, antic5
	.byte JVB, <dlist, >dlist
.endp
