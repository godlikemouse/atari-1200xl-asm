.local level4_map
intro
	.byte $ff,$04,$66,$ff,$0a,$00,$98,$99,$8a,$8b,$ac,$ad,$8a,$8b,$98,$99,$00,$00,$f4,$f5,$ff,$08,$00,$ff,$08,$66,$ff,$04,$00,$0e,$0f,$0a,$0b,$28,$29,$00,$01,$08,$09,$02,$03,$28,$29,$00,$00,$06,$07,$02,$03,$26,$27,$10,$11,$ff,$04,$00,$ff,$08,$66,$ff,$20,$00,$ff,$07,$66,$00,$62,$63,$ff,$0e,$00,$62,$63,$ff,$0c,$00,$62,$63,$00,$ff,$05,$66,$ff,$05,$00,$38,$ff,$07,$00,$38,$ff,$09,$00,$38,$ff,$06,$00,$38,$ff,$05,$00,$66,$66,$36,$37,$36,$37,$36,$37,$36,$37,$36,$37,$36,$37,$36,$37,$36,$37,$36,$37,$36,$37,$36,$37,$36,$37,$36,$37,$36,$37,$36,$37,$36,$37,$36,$37,$36,$37,$36,$37,$36,$37,$68,$69,$36,$37,$36,$37,$36,$37,$00,$68,$69,$68,$69,$68,$69,$68,$69,$68,$69,$68,$69,$68,$69,$68,$69,$68,$69,$68,$69,$68,$69,$00,$36,$37,$36,$37,$36,$37,$68,$69,$00,$00,$6a,$37,$36,$37,$36,$6b,$ff,$18,$00,$6a,$37,$36,$37,$36,$6b,$ff,$05,$00,$6a,$36,$37,$6b,$ff,$1a,$00,$6a,$36,$37,$6b,$ff,$07,$00,$36,$37,$ff,$1c,$00,$36,$37,$ff,$08,$00,$36,$37,$ff,$1c,$00,$36,$37,$ff,$08,$00,$36,$37,$ff,$1c,$00,$36,$37,$ff,$04,$00

map
	.byte $10,$11,$10,$11,$10,$11,$10,$11,$10,$11,$10,$11,$10,$11,$10,$11,$10,$11,$10,$11,$10,$11,$10,$11,$10,$11,$10,$11,$10,$11,$10,$11,$10,$11,$10,$11,$10,$11,$08,$0b,$10,$11,$02,$03,$04,$05,$0f,$05,$04,$05,$04,$05,$04,$05,$04,$05,$04,$0f,$04,$05,$04,$05,$04,$05,$04,$05,$04,$05,$0f,$05,$04,$05,$04,$05,$04,$05,$10,$11,$06,$07,$10,$11,$06,$07,$ff,$09,$00,$18,$19,$ff,$04,$00,$2a,$2b,$ff,$04,$00,$18,$19,$ff,$09,$00,$10,$11,$06,$07,$10,$11,$06,$07,$ff,$0d,$00,$2a,$2b,$2a,$2b,$2a,$2b,$ff,$0d,$00,$10,$11,$06,$07,$10,$11,$06,$07,$ff,$0b,$00,$2a,$2b,$2a,$2b,$2a,$2b,$2a,$2b,$2a,$2b,$ff,$0b,$00,$10,$11,$06,$07,$10,$11,$06,$07,$1b,$ff,$08,$00,$2a,$2b,$2a,$2b,$2a,$2b,$2a,$2b,$2a,$2b,$2a,$2b,$2a,$2b,$ff,$08,$00,$1b,$10,$11,$06,$07,$10,$11,$06,$07,$1b,$ff,$08,$00,$2a,$2b,$2a,$2b,$2a,$2b,$2a,$2b,$2a,$2b,$2a,$2b,$2a,$2b,$ff,$08,$00,$1b,$10,$11,$06,$07,$10,$11,$06,$07,$ff,$0b,$00,$2a,$2b,$2a,$2b,$2a,$2b,$2a,$2b,$2a,$2b,$ff,$0b,$00,$10,$11,$06,$07,$10,$11,$06,$07,$ff,$0d,$00,$2a,$2b,$2a,$2b,$2a,$2b,$ff,$0d,$00,$10,$11,$06,$07,$10,$11,$06,$07,$50,$51,$ff,$07,$00,$18,$19,$ff,$04,$00,$2a,$2b,$ff,$04,$00,$18,$19,$ff,$09,$00,$10,$11,$06,$07,$10,$11,$10,$11,$10,$11,$10,$11,$10,$11,$10,$11,$10,$11,$10,$11,$10,$11,$10,$11,$10,$11,$10,$11,$10,$11,$10,$11,$10,$11,$10,$11,$10,$11,$10,$11,$10,$11,$06,$07,$0a,$0b,$04,$05,$04,$05,$04,$05,$04,$05,$04,$05,$04,$05,$04,$05,$04,$05,$04,$05,$04,$05,$04,$05,$04,$05,$04,$05,$04,$05,$04,$05,$04,$05,$04,$05,$04,$05,$08,$09

attrs
	.byte 1,$b7,$28 ; player pos x/y
	.byte 2\.word level5 ; next level
	.byte 9,0,0 ; enemy pos x/y
	.byte 0
.endl
