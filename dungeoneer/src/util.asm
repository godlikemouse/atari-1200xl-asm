; util.asm
;   Utility functions and routines

;
; between
;   compares low <= acc < high
;   stores temporarily $e0 (TMP0)
;   result stored in acc
.macro between low, high
    ;save stack
    sta TMP0
    txa
    pha

    lda TMP0
    ldx :low
    stx TMP0

    ;compare acc to low end
    cmp TMP0
    bcc fail

    ;compare acc to high end
    ldx :high
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
.endm

;
; between
;   compares low <= value < high
;   stores temporarily TMP0,TMP1,TMP2,TMP3
;   result stored in acc
.proc bet (.byte low+1, value+1, high+1) .var
low mva #0 TMP1
value mva #0 TMP2
high mva #0 TMP3

    ;save stack
    txa
    pha

    lda TMP2
    ldx TMP1
    stx TMP0

    ;compare acc to low end
    cmp TMP0
    bcc fail

    ;compare acc to high end
    ldx TMP3
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
