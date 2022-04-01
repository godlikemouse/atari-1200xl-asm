;
    org $0600

TMP0 = $e0
TMP1 = $e1

    ;lda #$c0
    ;between #$c0, #$c2
    lda #13
    sta TMP1
    lda TMP1
    sta TMP0 % 2

    jmp *
