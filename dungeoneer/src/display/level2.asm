.local level2_map
intro
	.byte $ff,$04,$66,$ff,$09,$00,$98,$99,$8a,$8b,$ac,$ad,$8a,$8b,$98,$99,$00,$00,$f0,$f1,$ff,$09,$00,$ff,$08,$66,$00,$00,$0a,$0b,$18,$19,$0a,$0b,$06,$07,$28,$29,$24,$25,$12,$13,$06,$07,$12,$13,$28,$29,$32,$33,$00,$00,$12,$13,$26,$27,$00,$00,$ff,$08,$66,$ff,$08,$00,$04,$05,$02,$03,$08,$09,$00,$00,$1a,$1b,$01,$16,$17,$02,$03,$32,$33,$ff,$07,$00,$ff,$07,$66,$ff,$03,$00,$62,$63,$ff,$0b,$00,$62,$63,$ff,$0b,$00,$62,$63,$ff,$03,$00,$ff,$05,$66,$00,$00,$38,$ff,$08,$00,$38,$ff,$0b,$00,$38,$ff,$08,$00,$38,$ff,$03,$00,$66,$66,$fe,$14,$36,$37,$64,$64,$fe,$03,$36,$37,$ff,$18,$64,$fe,$03,$36,$37,$64,$64,$00,$00,$6a,$fe,$02,$37,$36,$6b,$ff,$18,$00,$6a,$fe,$02,$37,$36,$6b,$ff,$05,$00,$6a,$36,$37,$6b,$ff,$1a,$00,$6a,$36,$37,$6b,$ff,$07,$00,$36,$37,$ff,$1c,$00,$36,$37,$ff,$08,$00,$36,$37,$ff,$1c,$00,$36,$37,$ff,$08,$00,$36,$37,$ff,$1c,$00,$36,$37,$ff,$04,$00

map
	.byte $fe,$13,$10,$11,$08,$0b,$10,$11,$02,$03,$04,$05,$3e,$fe,$02,$05,$04,$0f,$fe,$03,$04,$05,$3e,$fe,$04,$05,$04,$0f,$fe,$04,$04,$05,$10,$11,$06,$07,$10,$11,$06,$07,$20,$21,$3e,$ff,$07,$00,$31,$ff,$03,$92,$3e,$92,$92,$31,$ff,$0e,$00,$10,$11,$06,$07,$10,$11,$06,$07,$00,$00,$3e,$ff,$04,$00,$ff,$08,$3e,$31,$31,$ff,$0f,$00,$10,$11,$06,$07,$10,$11,$06,$07,$ff,$06,$00,$31,$3e,$92,$31,$ff,$0a,$00,$ff,$06,$3e,$10,$11,$fe,$02,$34,$35,$10,$11,$06,$07,$10,$11,$06,$07,$ff,$05,$00,$31,$92,$3e,$31,$ff,$0e,$00,$3e,$00,$31,$10,$11,$14,$15,$16,$17,$10,$11,$06,$07,$10,$11,$06,$07,$ff,$05,$00,$31,$92,$3e,$ff,$08,$00,$ff,$05,$31,$00,$00,$3e,$00,$31,$10,$11,$06,$07,$00,$00,$10,$11,$06,$07,$10,$11,$06,$07,$31,$ff,$05,$00,$31,$3e,$ff,$07,$00,$31,$ff,$04,$92,$31,$ff,$04,$00,$31,$10,$11,$06,$07,$00,$00,$10,$11,$06,$07,$10,$11,$06,$07,$92,$31,$3e,$31,$ff,$09,$00,$ff,$06,$3e,$92,$ff,$06,$31,$10,$11,$06,$07,$00,$00,$10,$11,$06,$07,$10,$11,$06,$07,$92,$92,$3e,$92,$31,$ff,$09,$00,$31,$ff,$03,$92,$3e,$ff,$07,$92,$10,$11,$06,$07,$50,$51,$10,$11,$06,$07,$fe,$13,$10,$11,$06,$07,$0a,$0b,$fe,$11,$04,$05,$04,$05,$08,$09

attrs
	.byte 1,$b7,$28 ; player pos x/y
	.byte 2\.word level3 ; next level
	.byte 8,4,2 ; key position
	.byte 9,$6b,$44 ; enemy pos x/y
	.byte 0
.endl
