; hardware.asm
;   Contains hardware related memory locations

SDLSTL = $0230  ; Display list starting address
CHBAS  = $02f4  ; CHaracter BAse Register
COLOR0 = $02c4	; Color for %01
COLOR1 = $02c5  ; Color for %10
COLOR2 = $02c6  ; Color for %11 (normal)
COLOR3 = $02c7  ; Color for %11 (inverse)
COLOR4 = $02c8  ; Color for %00 (background)
PCOLR0 = $2C0 	; Color for Player-Missile 0
PCOLR1 = $2C1 	; Color for Player-Missile 1
PCOLR2 = $2C2 	; Color for Player-Missile 2
PCOLR3 = $2C3 	; Color for Player-Missile 3
GRACTL = $D01D  ; Enable/disable PMG
PMBASE = $D407  ; Player Missile Graphics Base address
GRPRIOR = $26F  ; Player-Missile Priority
SDMCTL = $22F   ; PM Resolution 46 ($2E) = double line resolution
HPOSP0 = $D000  ; Horizontal position of player 0
HPOSP1 = $D001  ; Horizontal position of player 1
HPOSP2 = $D002  ; Horizontal position of player 2
HPOSP3 = $D003  ; Horizontal position of player 3

PACTL=$D302 ; joystick port control
STICK0=$0278 ; joystick port 0
