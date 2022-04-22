; util.asm
;   Utility functions and routines

;
; between
;   compares low <= value < high
;   stores temporarily TMP0,TMP6,TMP7,TMP8
;   result stored in acc
.proc between (.byte low+1, value+1, high+1) .var
low mva #0 TMP6
value mva #0 TMP7
high mva #0 TMP8
_low=TMP6
_value=TMP7
_high=TMP8

    ;save stack
    txa
    pha

    lda _value
    ldx _low
    stx TMP0

    ;compare acc to low end
    cmp TMP0
    bcc fail

    ;compare acc to high end
    ldx _high
    stx TMP0
    cmp TMP0
    bcs fail
    lda #1
    sta TMP0
    jmp done

fail
    lda #0
    sta TMP0

done
	;restore stack
	pla
	tax
	lda TMP0
	rts
.endp
