.local level1_map
intro
	.byte $ff,$04,$66,$ff,$09,$00,$98,$99,$8a,$8b,$ac,$ad,$8a,$8b,$98,$99,$00,$00,$ee,$ef,$ff,$09,$00,$ff,$08,$66,$ff,$05,$00,$04,$05,$0a,$0b,$2e,$2f,$02,$03,$24,$25,$0a,$0b,$00,$00,$28,$29,$10,$11,$0a,$0b,$ff,$07,$00,$ff,$08,$66,$ff,$09,$00,$26,$27,$20,$21,$12,$13,$08,$09,$0a,$0b,$24,$25,$ff,$0b,$00,$ff,$07,$66,$ff,$03,$00,$62,$63,$ff,$0b,$00,$62,$63,$ff,$0b,$00,$62,$63,$ff,$03,$00,$ff,$05,$66,$00,$00,$38,$ff,$1d,$00,$38,$ff,$03,$00,$66,$66,$fe,$14,$36,$37,$e7,$e7,$fe,$03,$36,$37,$ff,$18,$e7,$fe,$03,$36,$37,$e7,$e7,$00,$00,$6a,$fe,$02,$37,$36,$6b,$ff,$18,$00,$6a,$fe,$02,$37,$36,$6b,$ff,$05,$00,$6a,$36,$37,$6b,$ff,$1a,$00,$6a,$36,$37,$6b,$ff,$07,$00,$36,$37,$ff,$1c,$00,$36,$37,$ff,$08,$00,$36,$37,$ff,$1c,$00,$36,$37,$ff,$08,$00,$36,$37,$ff,$1c,$00,$36,$37,$ff,$04,$00

map
	.byte $fe,$13,$10,$11,$08,$0b,$10,$11,$02,$03,$04,$05,$0f,$fe,$02,$05,$04,$ff,$03,$9e,$04,$05,$04,$0f,$0e,$05,$04,$05,$ff,$03,$9e,$05,$04,$05,$0f,$fe,$03,$05,$04,$05,$10,$11,$06,$07,$10,$11,$06,$07,$ff,$03,$00,$31,$ff,$09,$92,$31,$ff,$03,$00,$31,$ff,$03,$92,$31,$ff,$0a,$00,$10,$11,$06,$07,$10,$11,$06,$07,$00,$31,$31,$ff,$09,$92,$31,$00,$00,$36,$ff,$07,$30,$36,$ff,$08,$00,$10,$11,$06,$07,$10,$11,$06,$07,$31,$ff,$0a,$92,$31,$ff,$03,$00,$36,$ff,$07,$30,$36,$ff,$08,$00,$10,$11,$06,$07,$10,$11,$06,$ff,$09,$1a,$92,$92,$31,$ff,$06,$00,$31,$ff,$03,$92,$31,$ff,$0a,$00,$10,$11,$06,$07,$10,$11,$06,$07,$ff,$07,$00,$1a,$92,$92,$31,$ff,$06,$00,$31,$ff,$03,$92,$31,$00,$00,$fe,$02,$10,$11,$fe,$02,$34,$35,$10,$11,$06,$07,$10,$11,$06,$07,$ff,$05,$00,$36,$ff,$06,$30,$36,$ff,$04,$00,$31,$ff,$03,$92,$31,$00,$00,$10,$11,$0a,$0b,$14,$15,$16,$17,$10,$11,$06,$07,$10,$11,$06,$07,$ff,$05,$00,$36,$ff,$06,$30,$36,$ff,$04,$00,$31,$ff,$03,$92,$31,$00,$00,$10,$11,$06,$07,$ff,$04,$00,$10,$11,$06,$07,$10,$11,$06,$07,$20,$21,$ff,$05,$00,$1a,$92,$92,$31,$ff,$06,$00,$31,$ff,$03,$92,$31,$00,$00,$10,$11,$06,$07,$00,$00,$50,$51,$10,$11,$06,$07,$fe,$13,$10,$11,$06,$07,$0a,$0b,$fe,$11,$04,$05,$04,$05,$08,$09

attrs
	.byte 1,$af,$36 ; player pos x/y
	.byte 2\.word level2 ; next level
	.byte 8,4,9 ; key position
	.byte 9,$4e,$52 ; enemy pos x/y
	.byte 0 ; end
.endl
