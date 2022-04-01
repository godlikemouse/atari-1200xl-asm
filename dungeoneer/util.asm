;
; between
; compares low <= acc < high
; stores temporarily $e0 (low), $e1 (high)
; result stored in acc
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
