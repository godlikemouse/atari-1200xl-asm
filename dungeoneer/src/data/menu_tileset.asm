	.local menu_data
	org menu_tileset1
	; char 0
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 1
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 2
	.byte %00000000
	.byte %00000011
	.byte %00001111
	.byte %00111100
	.byte %00111100
	.byte %00111111
	.byte %00111100
	.byte %00000000
	; char 3
	.byte %00000000
	.byte %11000000
	.byte %11110000
	.byte %00111100
	.byte %00111100
	.byte %11111100
	.byte %00111100
	.byte %00000000
	; char 4
	.byte %00000000
	.byte %00111111
	.byte %00111100
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00111111
	.byte %00000000
	; char 5
	.byte %00000000
	.byte %11110000
	.byte %00111100
	.byte %11110000
	.byte %00111100
	.byte %00111100
	.byte %11110000
	.byte %00000000
	; char 6
	.byte %00000000
	.byte %00001111
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00001111
	.byte %00000000
	; char 7
	.byte %00000000
	.byte %11110000
	.byte %00111100
	.byte %00000000
	.byte %00000000
	.byte %00111100
	.byte %11110000
	.byte %00000000
	; char 8
	.byte %00000000
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111111
	.byte %00000000
	; char 9
	.byte %00000000
	.byte %11000000
	.byte %11110000
	.byte %00111100
	.byte %00111100
	.byte %11110000
	.byte %11000000
	.byte %00000000
	; char 10
	.byte %00000000
	.byte %00111111
	.byte %00111100
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00111111
	.byte %00000000
	; char 11
	.byte %00000000
	.byte %11111100
	.byte %00000000
	.byte %11110000
	.byte %00000000
	.byte %00000000
	.byte %11111100
	.byte %00000000
	; char 12
	.byte %00000000
	.byte %00111111
	.byte %00111100
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00000000
	; char 13
	.byte %00000000
	.byte %11111100
	.byte %00000000
	.byte %11110000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 14
	.byte %00000000
	.byte %00001111
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00001111
	.byte %00000000
	; char 15
	.byte %00000000
	.byte %11111100
	.byte %00000000
	.byte %00000000
	.byte %11111100
	.byte %00111100
	.byte %11111100
	.byte %00000000
	; char 16
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00000000
	; char 17
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %11111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00000000
	; char 18
	.byte %00000000
	.byte %00111111
	.byte %00000011
	.byte %00000011
	.byte %00000011
	.byte %00000011
	.byte %00111111
	.byte %00000000
	; char 19
	.byte %00000000
	.byte %11111100
	.byte %11000000
	.byte %11000000
	.byte %11000000
	.byte %11000000
	.byte %11111100
	.byte %00000000
	; char 20
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00111100
	.byte %00001111
	.byte %00000000
	; char 21
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %11110000
	.byte %00000000
	; char 22
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %00111111
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00000000
	; char 23
	.byte %00000000
	.byte %00111100
	.byte %11110000
	.byte %11000000
	.byte %11000000
	.byte %11110000
	.byte %00111100
	.byte %00000000
	; char 24
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111111
	.byte %00000000
	; char 25
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %11111100
	.byte %00000000
	; char 26
	.byte %00000000
	.byte %00111100
	.byte %00111111
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00000000
	; char 27
	.byte %00000000
	.byte %00001111
	.byte %00111111
	.byte %11111111
	.byte %11001111
	.byte %00001111
	.byte %00001111
	.byte %00000000
	; char 28
	.byte %00000000
	.byte %00111100
	.byte %00111111
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00000000
	; char 29
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %11111100
	.byte %11111100
	.byte %00111100
	.byte %00111100
	.byte %00000000
	; char 30
	.byte %00000000
	.byte %00001111
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00001111
	.byte %00000000
	; char 31
	.byte %00000000
	.byte %11110000
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %11110000
	.byte %00000000
	; char 32
	.byte %00000000
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00000000
	; char 33
	.byte %00000000
	.byte %11110000
	.byte %00111100
	.byte %00111100
	.byte %11110000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 34
	.byte %00000000
	.byte %00001111
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00001111
	.byte %00000000
	; char 35
	.byte %00000000
	.byte %11110000
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %11110000
	.byte %00111100
	.byte %00000000
	; char 36
	.byte %00000000
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00000000
	; char 37
	.byte %00000000
	.byte %11110000
	.byte %00111100
	.byte %00111100
	.byte %11110000
	.byte %11110000
	.byte %00111100
	.byte %00000000
	; char 38
	.byte %00000000
	.byte %00001111
	.byte %00111100
	.byte %00001111
	.byte %00000000
	.byte %00000000
	.byte %00001111
	.byte %00000000
	; char 39
	.byte %00000000
	.byte %11110000
	.byte %00000000
	.byte %11110000
	.byte %00111100
	.byte %00111100
	.byte %11110000
	.byte %00000000
	; char 40
	.byte %00000000
	.byte %00111111
	.byte %00000011
	.byte %00000011
	.byte %00000011
	.byte %00000011
	.byte %00000011
	.byte %00000000
	; char 41
	.byte %00000000
	.byte %11111100
	.byte %11000000
	.byte %11000000
	.byte %11000000
	.byte %11000000
	.byte %11000000
	.byte %00000000
	; char 42
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111111
	.byte %00000000
	; char 43
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %11111100
	.byte %00000000
	; char 44
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00001111
	.byte %00000011
	.byte %00000000
	; char 45
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %11110000
	.byte %11000000
	.byte %00000000
	; char 46
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111111
	.byte %00111111
	.byte %00111100
	.byte %00000000
	; char 47
	.byte %00000000
	.byte %00001111
	.byte %00001111
	.byte %11001111
	.byte %11111111
	.byte %00111111
	.byte %00001111
	.byte %00000000
	; char 48
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %00001111
	.byte %00001111
	.byte %00111100
	.byte %00111100
	.byte %00000000
	; char 49
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %11110000
	.byte %11110000
	.byte %00111100
	.byte %00111100
	.byte %00000000
	; char 50
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %00001111
	.byte %00000011
	.byte %00000011
	.byte %00000011
	.byte %00000000
	; char 51
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %11110000
	.byte %11000000
	.byte %11000000
	.byte %11000000
	.byte %00000000
	; char 52
	.byte %00000000
	.byte %00111111
	.byte %00000000
	.byte %00000011
	.byte %00001111
	.byte %00111100
	.byte %00111111
	.byte %00000000
	; char 53
	.byte %00000000
	.byte %11111100
	.byte %11110000
	.byte %11000000
	.byte %00000000
	.byte %00000000
	.byte %11111100
	.byte %00000000
	; char 54
	.byte %10101010
	.byte %10100101
	.byte %01010101
	.byte %00000000
	.byte %01010010
	.byte %01010010
	.byte %01010010
	.byte %00000000
	; char 55
	.byte %01001010
	.byte %01001010
	.byte %01001001
	.byte %00000000
	.byte %10101001
	.byte %10010101
	.byte %01010101
	.byte %00000000
	; char 56
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 57
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000001
	.byte %00000110
	.byte %00011010
	.byte %00011010
	.byte %00011010
	; char 58
	.byte %00000000
	.byte %00010101
	.byte %01101010
	.byte %01101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	; char 59
	.byte %01010101
	.byte %01101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	; char 60
	.byte %01010101
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	; char 61
	.byte %01000000
	.byte %01010101
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	; char 62
	.byte %00000000
	.byte %00000000
	.byte %01000000
	.byte %01010000
	.byte %10100100
	.byte %10101001
	.byte %10101001
	.byte %10101001
	; char 63
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 64
	.byte %00000000
	.byte %00000001
	.byte %00000001
	.byte %00000001
	.byte %00000001
	.byte %00000001
	.byte %00000001
	.byte %00000000
	; char 65
	.byte %01101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %01101010
	; char 66
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	; char 67
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	; char 68
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	; char 69
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	; char 70
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	; char 71
	.byte %01000000
	.byte %10010000
	.byte %10010000
	.byte %10010000
	.byte %10010000
	.byte %10010000
	.byte %10000000
	.byte %01000000
	; char 72
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000001
	.byte %00000001
	.byte %00000001
	; char 73
	.byte %01011001
	.byte %00010101
	.byte %00010100
	.byte %00010100
	.byte %01010100
	.byte %10100100
	.byte %10100101
	.byte %10101001
	; char 74
	.byte %01010101
	.byte %01000001
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %01000001
	.byte %01000001
	; char 75
	.byte %10101010
	.byte %01010110
	.byte %00000101
	.byte %00000001
	.byte %00000101
	.byte %00010101
	.byte %01011010
	.byte %01011010
	; char 76
	.byte %10101010
	.byte %10100101
	.byte %10010100
	.byte %01010000
	.byte %01010100
	.byte %01010101
	.byte %01101001
	.byte %00101001
	; char 77
	.byte %10010101
	.byte %01010000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %01010000
	.byte %01010000
	; char 78
	.byte %01011001
	.byte %01010101
	.byte %00000101
	.byte %00000101
	.byte %00000101
	.byte %00000110
	.byte %01010110
	.byte %01011010
	; char 79
	.byte %01000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %01000000
	.byte %10010000
	.byte %10010000
	.byte %10010000
	; char 80
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 81
	.byte %01010110
	.byte %01010110
	.byte %00000100
	.byte %00000101
	.byte %00000010
	.byte %00000010
	.byte %00000001
	.byte %00000001
	; char 82
	.byte %10010101
	.byte %10010101
	.byte %00000010
	.byte %01000001
	.byte %10000001
	.byte %10000001
	.byte %01000001
	.byte %01010100
	; char 83
	.byte %10100101
	.byte %10100100
	.byte %10100100
	.byte %10100101
	.byte %01101010
	.byte %01011010
	.byte %01011010
	.byte %00000101
	; char 84
	.byte %00010110
	.byte %00000110
	.byte %01000110
	.byte %01010110
	.byte %01101010
	.byte %01101001
	.byte %00101001
	.byte %01010100
	; char 85
	.byte %10010101
	.byte %10010101
	.byte %10100000
	.byte %10010000
	.byte %01010000
	.byte %01010000
	.byte %01010000
	.byte %00000101
	; char 86
	.byte %10100101
	.byte %10100101
	.byte %00000100
	.byte %01010100
	.byte %10100000
	.byte %10100000
	.byte %01010000
	.byte %01010000
	; char 87
	.byte %01000000
	.byte %01000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 88
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 89
	.byte %00000001
	.byte %00000010
	.byte %00000001
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 90
	.byte %01010101
	.byte %10101010
	.byte %01101010
	.byte %00101010
	.byte %00010110
	.byte %00000010
	.byte %00000000
	.byte %00000000
	; char 91
	.byte %01000101
	.byte %10001010
	.byte %10011010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %01010101
	.byte %00010101
	; char 92
	.byte %01010100
	.byte %00101000
	.byte %01101001
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %01010101
	.byte %01010101
	; char 93
	.byte %01010101
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10100101
	.byte %10100000
	.byte %01000000
	.byte %00000000
	; char 94
	.byte %01010000
	.byte %10100000
	.byte %01010000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 95
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 96
	.byte %00000000
	.byte %00000000
	.byte %00000011
	.byte %00000010
	.byte %00000010
	.byte %00000010
	.byte %00000101
	.byte %00000000
	; char 97
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %01000000
	.byte %00000000
	; char 98
	.byte %00000010
	.byte %00001001
	.byte %00100100
	.byte %00100100
	.byte %00100100
	.byte %00101010
	.byte %00010101
	.byte %00000000
	; char 99
	.byte %01000000
	.byte %00010000
	.byte %00000100
	.byte %00000100
	.byte %00000100
	.byte %10100100
	.byte %01010100
	.byte %00000000
	; char 100
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 101
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 102
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 103
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 104
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 105
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 106
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 107
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 108
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 109
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 110
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 111
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 112
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 113
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 114
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 115
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 116
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 117
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 118
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 119
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 120
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 121
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 122
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 123
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 124
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 125
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 126
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 127
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	org menu_tileset2
	; char 0
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 1
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 2
	.byte %00000000
	.byte %00000011
	.byte %00001111
	.byte %00111100
	.byte %00111100
	.byte %00111111
	.byte %00111100
	.byte %00000000
	; char 3
	.byte %00000000
	.byte %11000000
	.byte %11110000
	.byte %00111100
	.byte %00111100
	.byte %11111100
	.byte %00111100
	.byte %00000000
	; char 4
	.byte %00000000
	.byte %00111111
	.byte %00111100
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00111111
	.byte %00000000
	; char 5
	.byte %00000000
	.byte %11110000
	.byte %00111100
	.byte %11110000
	.byte %00111100
	.byte %00111100
	.byte %11110000
	.byte %00000000
	; char 6
	.byte %00000000
	.byte %00001111
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00001111
	.byte %00000000
	; char 7
	.byte %00000000
	.byte %11110000
	.byte %00111100
	.byte %00000000
	.byte %00000000
	.byte %00111100
	.byte %11110000
	.byte %00000000
	; char 8
	.byte %00000000
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111111
	.byte %00000000
	; char 9
	.byte %00000000
	.byte %11000000
	.byte %11110000
	.byte %00111100
	.byte %00111100
	.byte %11110000
	.byte %11000000
	.byte %00000000
	; char 10
	.byte %00000000
	.byte %00111111
	.byte %00111100
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00111111
	.byte %00000000
	; char 11
	.byte %00000000
	.byte %11111100
	.byte %00000000
	.byte %11110000
	.byte %00000000
	.byte %00000000
	.byte %11111100
	.byte %00000000
	; char 12
	.byte %00000000
	.byte %00111111
	.byte %00111100
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00000000
	; char 13
	.byte %00000000
	.byte %11111100
	.byte %00000000
	.byte %11110000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 14
	.byte %00000000
	.byte %00001111
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00001111
	.byte %00000000
	; char 15
	.byte %00000000
	.byte %11111100
	.byte %00000000
	.byte %00000000
	.byte %11111100
	.byte %00111100
	.byte %11111100
	.byte %00000000
	; char 16
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00000000
	; char 17
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %11111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00000000
	; char 18
	.byte %00000000
	.byte %00111111
	.byte %00000011
	.byte %00000011
	.byte %00000011
	.byte %00000011
	.byte %00111111
	.byte %00000000
	; char 19
	.byte %00000000
	.byte %11111100
	.byte %11000000
	.byte %11000000
	.byte %11000000
	.byte %11000000
	.byte %11111100
	.byte %00000000
	; char 20
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00111100
	.byte %00001111
	.byte %00000000
	; char 21
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %11110000
	.byte %00000000
	; char 22
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %00111111
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00000000
	; char 23
	.byte %00000000
	.byte %00111100
	.byte %11110000
	.byte %11000000
	.byte %11000000
	.byte %11110000
	.byte %00111100
	.byte %00000000
	; char 24
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111111
	.byte %00000000
	; char 25
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %11111100
	.byte %00000000
	; char 26
	.byte %00000000
	.byte %00111100
	.byte %00111111
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00000000
	; char 27
	.byte %00000000
	.byte %00001111
	.byte %00111111
	.byte %11111111
	.byte %11001111
	.byte %00001111
	.byte %00001111
	.byte %00000000
	; char 28
	.byte %00000000
	.byte %00111100
	.byte %00111111
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00000000
	; char 29
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %11111100
	.byte %11111100
	.byte %00111100
	.byte %00111100
	.byte %00000000
	; char 30
	.byte %00000000
	.byte %00001111
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00001111
	.byte %00000000
	; char 31
	.byte %00000000
	.byte %11110000
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %11110000
	.byte %00000000
	; char 32
	.byte %00000000
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00000000
	; char 33
	.byte %00000000
	.byte %11110000
	.byte %00111100
	.byte %00111100
	.byte %11110000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 34
	.byte %00000000
	.byte %00001111
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00001111
	.byte %00000000
	; char 35
	.byte %00000000
	.byte %11110000
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %11110000
	.byte %00111100
	.byte %00000000
	; char 36
	.byte %00000000
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00000000
	; char 37
	.byte %00000000
	.byte %11110000
	.byte %00111100
	.byte %00111100
	.byte %11110000
	.byte %11110000
	.byte %00111100
	.byte %00000000
	; char 38
	.byte %00000000
	.byte %00001111
	.byte %00111100
	.byte %00001111
	.byte %00000000
	.byte %00000000
	.byte %00001111
	.byte %00000000
	; char 39
	.byte %00000000
	.byte %11110000
	.byte %00000000
	.byte %11110000
	.byte %00111100
	.byte %00111100
	.byte %11110000
	.byte %00000000
	; char 40
	.byte %00000000
	.byte %00111111
	.byte %00000011
	.byte %00000011
	.byte %00000011
	.byte %00000011
	.byte %00000011
	.byte %00000000
	; char 41
	.byte %00000000
	.byte %11111100
	.byte %11000000
	.byte %11000000
	.byte %11000000
	.byte %11000000
	.byte %11000000
	.byte %00000000
	; char 42
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111111
	.byte %00000000
	; char 43
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %11111100
	.byte %00000000
	; char 44
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00001111
	.byte %00000011
	.byte %00000000
	; char 45
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %11110000
	.byte %11000000
	.byte %00000000
	; char 46
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111111
	.byte %00111111
	.byte %00111100
	.byte %00000000
	; char 47
	.byte %00000000
	.byte %00001111
	.byte %00001111
	.byte %11001111
	.byte %11111111
	.byte %00111111
	.byte %00001111
	.byte %00000000
	; char 48
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %00001111
	.byte %00001111
	.byte %00111100
	.byte %00111100
	.byte %00000000
	; char 49
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %11110000
	.byte %11110000
	.byte %00111100
	.byte %00111100
	.byte %00000000
	; char 50
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %00001111
	.byte %00000011
	.byte %00000011
	.byte %00000011
	.byte %00000000
	; char 51
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %11110000
	.byte %11000000
	.byte %11000000
	.byte %11000000
	.byte %00000000
	; char 52
	.byte %00000000
	.byte %00111111
	.byte %00000000
	.byte %00000011
	.byte %00001111
	.byte %00111100
	.byte %00111111
	.byte %00000000
	; char 53
	.byte %00000000
	.byte %11111100
	.byte %11110000
	.byte %11000000
	.byte %00000000
	.byte %00000000
	.byte %11111100
	.byte %00000000
	; char 54
	.byte %10101010
	.byte %10100101
	.byte %01010101
	.byte %00000000
	.byte %01010010
	.byte %01010010
	.byte %01010010
	.byte %00000000
	; char 55
	.byte %01001010
	.byte %01001010
	.byte %01001001
	.byte %00000000
	.byte %10101001
	.byte %10010101
	.byte %01010101
	.byte %00000000
	; char 56
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 57
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000001
	.byte %00000110
	.byte %00011010
	.byte %00011010
	.byte %00011010
	; char 58
	.byte %00000000
	.byte %00010101
	.byte %01101010
	.byte %01101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	; char 59
	.byte %01010101
	.byte %01101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	; char 60
	.byte %01010101
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	; char 61
	.byte %01000000
	.byte %01010101
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	; char 62
	.byte %00000000
	.byte %00000000
	.byte %01000000
	.byte %01010000
	.byte %10100100
	.byte %10101001
	.byte %10101001
	.byte %10101001
	; char 63
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 64
	.byte %00000000
	.byte %00000001
	.byte %00000001
	.byte %00000001
	.byte %00000001
	.byte %00000001
	.byte %00000001
	.byte %00000000
	; char 65
	.byte %01101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %01101010
	; char 66
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	; char 67
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	; char 68
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	; char 69
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	; char 70
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	; char 71
	.byte %01000000
	.byte %10010000
	.byte %10010000
	.byte %10010000
	.byte %10010000
	.byte %10010000
	.byte %10000000
	.byte %01000000
	; char 72
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000001
	.byte %00000001
	.byte %00000001
	; char 73
	.byte %01011001
	.byte %00010101
	.byte %00010100
	.byte %00010100
	.byte %01010100
	.byte %10100100
	.byte %10100101
	.byte %10101001
	; char 74
	.byte %01010101
	.byte %01000001
	.byte %00000000
	.byte %00001100
	.byte %00000000
	.byte %00000000
	.byte %01000001
	.byte %01000001
	; char 75
	.byte %10101010
	.byte %01010110
	.byte %00000101
	.byte %00000001
	.byte %00000101
	.byte %00010101
	.byte %01011010
	.byte %01011010
	; char 76
	.byte %10101010
	.byte %10100101
	.byte %10010100
	.byte %01010000
	.byte %01010100
	.byte %01010101
	.byte %01101001
	.byte %00101001
	; char 77
	.byte %10010101
	.byte %01010000
	.byte %00000000
	.byte %00001100
	.byte %00000000
	.byte %00000000
	.byte %01010000
	.byte %01010000
	; char 78
	.byte %01011001
	.byte %01010101
	.byte %00000101
	.byte %00000101
	.byte %00000101
	.byte %00000110
	.byte %01010110
	.byte %01011010
	; char 79
	.byte %01000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %01000000
	.byte %10010000
	.byte %10010000
	.byte %10010000
	; char 80
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 81
	.byte %01010110
	.byte %01010110
	.byte %00000100
	.byte %00000101
	.byte %00000010
	.byte %00000010
	.byte %00000001
	.byte %00000001
	; char 82
	.byte %10010101
	.byte %10010101
	.byte %00000010
	.byte %01000001
	.byte %10000001
	.byte %10000001
	.byte %01000001
	.byte %01010100
	; char 83
	.byte %10100101
	.byte %10100100
	.byte %10100100
	.byte %10100101
	.byte %01101010
	.byte %01011010
	.byte %01011010
	.byte %00000101
	; char 84
	.byte %00010110
	.byte %00000110
	.byte %01000110
	.byte %01010110
	.byte %01101010
	.byte %01101001
	.byte %00101001
	.byte %01010100
	; char 85
	.byte %10010101
	.byte %10010101
	.byte %10100000
	.byte %10010000
	.byte %01010000
	.byte %01010000
	.byte %01010000
	.byte %00000101
	; char 86
	.byte %10100101
	.byte %10100101
	.byte %00000100
	.byte %01010100
	.byte %10100000
	.byte %10100000
	.byte %01010000
	.byte %01010000
	; char 87
	.byte %01000000
	.byte %01000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 88
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 89
	.byte %00000001
	.byte %00000010
	.byte %00000001
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 90
	.byte %01010101
	.byte %10101010
	.byte %01101010
	.byte %00101010
	.byte %00010110
	.byte %00000010
	.byte %00000000
	.byte %00000000
	; char 91
	.byte %01000101
	.byte %10001010
	.byte %10011010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %01010101
	.byte %00010101
	; char 92
	.byte %01010100
	.byte %00101000
	.byte %01101001
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %01010101
	.byte %01010101
	; char 93
	.byte %01010101
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10100101
	.byte %10100000
	.byte %01000000
	.byte %00000000
	; char 94
	.byte %01010000
	.byte %10100000
	.byte %01010000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 95
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 96
	.byte %00000000
	.byte %00000011
	.byte %00000000
	.byte %00000010
	.byte %00000010
	.byte %00000010
	.byte %00000101
	.byte %00000000
	; char 97
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %01000000
	.byte %00000000
	; char 98
	.byte %00000010
	.byte %00001001
	.byte %00100100
	.byte %00100100
	.byte %00100100
	.byte %00101010
	.byte %00010101
	.byte %00000000
	; char 99
	.byte %01000000
	.byte %00010000
	.byte %00000100
	.byte %00000100
	.byte %00000100
	.byte %10100100
	.byte %01010100
	.byte %00000000
	; char 100
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 101
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 102
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 103
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 104
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 105
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 106
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 107
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 108
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 109
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 110
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 111
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 112
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 113
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 114
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 115
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 116
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 117
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 118
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 119
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 120
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 121
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 122
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 123
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 124
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 125
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 126
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 127
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	org menu_tileset3
	; char 0
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 1
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 2
	.byte %00000000
	.byte %00000011
	.byte %00001111
	.byte %00111100
	.byte %00111100
	.byte %00111111
	.byte %00111100
	.byte %00000000
	; char 3
	.byte %00000000
	.byte %11000000
	.byte %11110000
	.byte %00111100
	.byte %00111100
	.byte %11111100
	.byte %00111100
	.byte %00000000
	; char 4
	.byte %00000000
	.byte %00111111
	.byte %00111100
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00111111
	.byte %00000000
	; char 5
	.byte %00000000
	.byte %11110000
	.byte %00111100
	.byte %11110000
	.byte %00111100
	.byte %00111100
	.byte %11110000
	.byte %00000000
	; char 6
	.byte %00000000
	.byte %00001111
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00001111
	.byte %00000000
	; char 7
	.byte %00000000
	.byte %11110000
	.byte %00111100
	.byte %00000000
	.byte %00000000
	.byte %00111100
	.byte %11110000
	.byte %00000000
	; char 8
	.byte %00000000
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111111
	.byte %00000000
	; char 9
	.byte %00000000
	.byte %11000000
	.byte %11110000
	.byte %00111100
	.byte %00111100
	.byte %11110000
	.byte %11000000
	.byte %00000000
	; char 10
	.byte %00000000
	.byte %00111111
	.byte %00111100
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00111111
	.byte %00000000
	; char 11
	.byte %00000000
	.byte %11111100
	.byte %00000000
	.byte %11110000
	.byte %00000000
	.byte %00000000
	.byte %11111100
	.byte %00000000
	; char 12
	.byte %00000000
	.byte %00111111
	.byte %00111100
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00000000
	; char 13
	.byte %00000000
	.byte %11111100
	.byte %00000000
	.byte %11110000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 14
	.byte %00000000
	.byte %00001111
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00001111
	.byte %00000000
	; char 15
	.byte %00000000
	.byte %11111100
	.byte %00000000
	.byte %00000000
	.byte %11111100
	.byte %00111100
	.byte %11111100
	.byte %00000000
	; char 16
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00000000
	; char 17
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %11111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00000000
	; char 18
	.byte %00000000
	.byte %00111111
	.byte %00000011
	.byte %00000011
	.byte %00000011
	.byte %00000011
	.byte %00111111
	.byte %00000000
	; char 19
	.byte %00000000
	.byte %11111100
	.byte %11000000
	.byte %11000000
	.byte %11000000
	.byte %11000000
	.byte %11111100
	.byte %00000000
	; char 20
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00111100
	.byte %00001111
	.byte %00000000
	; char 21
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %11110000
	.byte %00000000
	; char 22
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %00111111
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00000000
	; char 23
	.byte %00000000
	.byte %00111100
	.byte %11110000
	.byte %11000000
	.byte %11000000
	.byte %11110000
	.byte %00111100
	.byte %00000000
	; char 24
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111111
	.byte %00000000
	; char 25
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %11111100
	.byte %00000000
	; char 26
	.byte %00000000
	.byte %00111100
	.byte %00111111
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00000000
	; char 27
	.byte %00000000
	.byte %00001111
	.byte %00111111
	.byte %11111111
	.byte %11001111
	.byte %00001111
	.byte %00001111
	.byte %00000000
	; char 28
	.byte %00000000
	.byte %00111100
	.byte %00111111
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00000000
	; char 29
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %11111100
	.byte %11111100
	.byte %00111100
	.byte %00111100
	.byte %00000000
	; char 30
	.byte %00000000
	.byte %00001111
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00001111
	.byte %00000000
	; char 31
	.byte %00000000
	.byte %11110000
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %11110000
	.byte %00000000
	; char 32
	.byte %00000000
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00000000
	; char 33
	.byte %00000000
	.byte %11110000
	.byte %00111100
	.byte %00111100
	.byte %11110000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 34
	.byte %00000000
	.byte %00001111
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00001111
	.byte %00000000
	; char 35
	.byte %00000000
	.byte %11110000
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %11110000
	.byte %00111100
	.byte %00000000
	; char 36
	.byte %00000000
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00111111
	.byte %00111100
	.byte %00111100
	.byte %00000000
	; char 37
	.byte %00000000
	.byte %11110000
	.byte %00111100
	.byte %00111100
	.byte %11110000
	.byte %11110000
	.byte %00111100
	.byte %00000000
	; char 38
	.byte %00000000
	.byte %00001111
	.byte %00111100
	.byte %00001111
	.byte %00000000
	.byte %00000000
	.byte %00001111
	.byte %00000000
	; char 39
	.byte %00000000
	.byte %11110000
	.byte %00000000
	.byte %11110000
	.byte %00111100
	.byte %00111100
	.byte %11110000
	.byte %00000000
	; char 40
	.byte %00000000
	.byte %00111111
	.byte %00000011
	.byte %00000011
	.byte %00000011
	.byte %00000011
	.byte %00000011
	.byte %00000000
	; char 41
	.byte %00000000
	.byte %11111100
	.byte %11000000
	.byte %11000000
	.byte %11000000
	.byte %11000000
	.byte %11000000
	.byte %00000000
	; char 42
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111111
	.byte %00000000
	; char 43
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %11111100
	.byte %00000000
	; char 44
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00001111
	.byte %00000011
	.byte %00000000
	; char 45
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %11110000
	.byte %11000000
	.byte %00000000
	; char 46
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %00111100
	.byte %00111111
	.byte %00111111
	.byte %00111100
	.byte %00000000
	; char 47
	.byte %00000000
	.byte %00001111
	.byte %00001111
	.byte %11001111
	.byte %11111111
	.byte %00111111
	.byte %00001111
	.byte %00000000
	; char 48
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %00001111
	.byte %00001111
	.byte %00111100
	.byte %00111100
	.byte %00000000
	; char 49
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %11110000
	.byte %11110000
	.byte %00111100
	.byte %00111100
	.byte %00000000
	; char 50
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %00001111
	.byte %00000011
	.byte %00000011
	.byte %00000011
	.byte %00000000
	; char 51
	.byte %00000000
	.byte %00111100
	.byte %00111100
	.byte %11110000
	.byte %11000000
	.byte %11000000
	.byte %11000000
	.byte %00000000
	; char 52
	.byte %00000000
	.byte %00111111
	.byte %00000000
	.byte %00000011
	.byte %00001111
	.byte %00111100
	.byte %00111111
	.byte %00000000
	; char 53
	.byte %00000000
	.byte %11111100
	.byte %11110000
	.byte %11000000
	.byte %00000000
	.byte %00000000
	.byte %11111100
	.byte %00000000
	; char 54
	.byte %10101010
	.byte %10100101
	.byte %01010101
	.byte %00000000
	.byte %01010010
	.byte %01010010
	.byte %01010010
	.byte %00000000
	; char 55
	.byte %01001010
	.byte %01001010
	.byte %01001001
	.byte %00000000
	.byte %10101001
	.byte %10010101
	.byte %01010101
	.byte %00000000
	; char 56
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 57
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000001
	.byte %00000110
	.byte %00011010
	.byte %00011010
	.byte %00011010
	; char 58
	.byte %00000000
	.byte %00010101
	.byte %01101010
	.byte %01101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	; char 59
	.byte %01010101
	.byte %01101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	; char 60
	.byte %01010101
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	; char 61
	.byte %01000000
	.byte %01010101
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	; char 62
	.byte %00000000
	.byte %00000000
	.byte %01000000
	.byte %01010000
	.byte %10100100
	.byte %10101001
	.byte %10101001
	.byte %10101001
	; char 63
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 64
	.byte %00000000
	.byte %00000001
	.byte %00000001
	.byte %00000001
	.byte %00000001
	.byte %00000001
	.byte %00000001
	.byte %00000000
	; char 65
	.byte %01101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %01101010
	; char 66
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	; char 67
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	; char 68
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	; char 69
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	; char 70
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	; char 71
	.byte %01000000
	.byte %10010000
	.byte %10010000
	.byte %10010000
	.byte %10010000
	.byte %10010000
	.byte %10000000
	.byte %01000000
	; char 72
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000001
	.byte %00000001
	.byte %00000001
	; char 73
	.byte %01011001
	.byte %00010101
	.byte %00010100
	.byte %00010100
	.byte %01010100
	.byte %10100100
	.byte %10100101
	.byte %10101001
	; char 74
	.byte %01010101
	.byte %01000001
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %01000001
	.byte %01000001
	; char 75
	.byte %10101010
	.byte %01010110
	.byte %00000101
	.byte %00000001
	.byte %00000101
	.byte %00010101
	.byte %01011010
	.byte %01011010
	; char 76
	.byte %10101010
	.byte %10100101
	.byte %10010100
	.byte %01010000
	.byte %01010100
	.byte %01010101
	.byte %01101001
	.byte %00101001
	; char 77
	.byte %10010101
	.byte %01010000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %01010000
	.byte %01010000
	; char 78
	.byte %01011001
	.byte %01010101
	.byte %00000101
	.byte %00000101
	.byte %00000101
	.byte %00000110
	.byte %01010110
	.byte %01011010
	; char 79
	.byte %01000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %01000000
	.byte %10010000
	.byte %10010000
	.byte %10010000
	; char 80
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 81
	.byte %01010110
	.byte %01010110
	.byte %00000100
	.byte %00000101
	.byte %00000010
	.byte %00000010
	.byte %00000001
	.byte %00000001
	; char 82
	.byte %10010101
	.byte %10010101
	.byte %00000010
	.byte %01000001
	.byte %10000001
	.byte %10000001
	.byte %01000001
	.byte %01010100
	; char 83
	.byte %10100101
	.byte %10100100
	.byte %10100100
	.byte %10100101
	.byte %01101010
	.byte %01011010
	.byte %01011010
	.byte %00000101
	; char 84
	.byte %00010110
	.byte %00000110
	.byte %01000110
	.byte %01010110
	.byte %01101010
	.byte %01101001
	.byte %00101001
	.byte %01010100
	; char 85
	.byte %10010101
	.byte %10010101
	.byte %10100000
	.byte %10010000
	.byte %01010000
	.byte %01010000
	.byte %01010000
	.byte %00000101
	; char 86
	.byte %10100101
	.byte %10100101
	.byte %00000100
	.byte %01010100
	.byte %10100000
	.byte %10100000
	.byte %01010000
	.byte %01010000
	; char 87
	.byte %01000000
	.byte %01000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 88
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 89
	.byte %00000001
	.byte %00000010
	.byte %00000001
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 90
	.byte %01010101
	.byte %10101010
	.byte %01101010
	.byte %00101010
	.byte %00010110
	.byte %00000010
	.byte %00000000
	.byte %00000000
	; char 91
	.byte %01000101
	.byte %10001010
	.byte %10011010
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %01010101
	.byte %00010101
	; char 92
	.byte %01010100
	.byte %00101000
	.byte %01101001
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %01010101
	.byte %01010101
	; char 93
	.byte %01010101
	.byte %10101010
	.byte %10101010
	.byte %10101010
	.byte %10100101
	.byte %10100000
	.byte %01000000
	.byte %00000000
	; char 94
	.byte %01010000
	.byte %10100000
	.byte %01010000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 95
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 96
	.byte %00000011
	.byte %00000000
	.byte %00000000
	.byte %00000010
	.byte %00000010
	.byte %00000010
	.byte %00000101
	.byte %00000000
	; char 97
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %01000000
	.byte %00000000
	; char 98
	.byte %00000010
	.byte %00001001
	.byte %00100100
	.byte %00100100
	.byte %00100100
	.byte %00101010
	.byte %00010101
	.byte %00000000
	; char 99
	.byte %01000000
	.byte %00010000
	.byte %00000100
	.byte %00000100
	.byte %00000100
	.byte %10100100
	.byte %01010100
	.byte %00000000
	; char 100
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 101
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 102
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 103
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 104
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 105
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 106
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 107
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 108
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 109
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 110
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 111
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 112
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 113
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 114
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 115
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 116
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 117
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 118
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 119
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 120
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 121
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 122
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 123
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 124
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 125
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 126
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	; char 127
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.endl
