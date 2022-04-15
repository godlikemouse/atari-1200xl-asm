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
; multiply
;   multiply v1 * v2, result in acc
.macro mul v1, v2

    ldx :v2
    lda :v1
loop
    add :v1
    dex
    cpx #1
    bne loop
.endm

; multiply .word
;   multiply v1 * v2, result in TMP4
.macro mulw v1, v2

    mwa :v2 TMP6
    mwa :v1 TMP4
loop
    adw TMP4 :v1
    sbw TMP6 #1
    cpw TMP6 #1
    bne loop
.endm
