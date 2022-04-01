;
; between
;   compares low <= acc < high
;   stores temporarily $e0 (low), $e1 (high)
;   result stored in acc
.macro between low, high
    ldx :low
    stx TMP0
    ldy :high
    sty TMP1

    ;compare acc to low end
    cmp TMP0
    bcc fail

    ;compare acc to high end
    cmp TMP1
    bcs fail
    lda #1
    jmp done
fail
    lda #0
done
.endm

;
; dual nop delay loop
;   itr1, number of first loop iterations
;   itr2, number of second loop iterations
.macro delay itr1, itr2
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
.endm
