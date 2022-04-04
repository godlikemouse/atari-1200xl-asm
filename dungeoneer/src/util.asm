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
; dual nop delay loop
;   itr1, number of first loop iterations
;   itr2, number of second loop iterations
.macro delay itr1, itr2
    ; store stack
    pha
    txa
    pha
    tya
    pha

    ldx :itr1
    ldy :itr2
itr1_loop
itr2_loop
    nop
    dex
    bne itr2_loop

    nop
    dey
    bne itr1_loop

    ; restore stack
    pla
    tay
    pla
    tax
    pla
.endm
