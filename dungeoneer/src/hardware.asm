; hardware.asm
;   Contains hardware related memory locations

; pmg
SDLSTL = $0230  ; Display list starting address
CHBAS  = $02f4  ; Character Base Register
COLOR0 = $02c4	; Color for %01
COLOR1 = $02c5  ; Color for %10
COLOR2 = $02c6  ; Color for %11 (normal)
COLOR3 = $02c7  ; Color for %11 (inverse)
COLOR4 = $02c8  ; Color for %00 (background)
PCOLR0 = $2c0 	; Color for Player-Missile 0
PCOLR1 = $2c1 	; Color for Player-Missile 1
PCOLR2 = $2c2 	; Color for Player-Missile 2
PCOLR3 = $2c3 	; Color for Player-Missile 3
GRACTL = $d01d  ; Enable/disable PMG
PMBASE = $d407  ; Player Missile Graphics Base address
GRPRIOR = $026f ; Player-Missile Priority
SDMCTL = $022f  ; PM Resolution 46 ($2E) = double line resolution
HPOSP0 = $d000  ; Horizontal position of player 0
HPOSP1 = $d001  ; Horizontal position of player 1
HPOSP2 = $d002  ; Horizontal position of player 2
HPOSP3 = $d003  ; Horizontal position of player 3
WSYNC = $d40a   ; Wait Sync

VVBLKD = $0224  ; Vertical Blank Interrupt Return
SETVBV = $e45c  ; Set Vertical Blank Interrupt Vector
XITVBV = $e462  ; Vertical Blank Interrupt Exit

VTIMR1 = $0210  ; Virtual Timer 1

; joystick
PACTL = $d302   ; joystick port control
STICK0 = $0278  ; joystick port 0
BTN0 = $0284    ; joystock port 0 button

; sound system
AF1C = $d200    ; FFFFFFFF ; F=Frequency
AC1C = $d201    ; NNNvVVVV ; N=Noise, v=Volume only, V=Volume
AF2C = $d202    ; FFFFFFFF ; F=Frequency
AC2C = $d203    ; NNNvVVVV ; N=Noise, v=Volume only V=Volume
AF3C = $d204    ; FFFFFFFF ; F=Frequency
AC3C = $d205    ; NNNvVVVV ; N=Noise, v=Volume only V=Volume
AF4C = $d206    ; FFFFFFFF ; F=Frequency
AC4C = $d207    ; NNNvVVVV ; N=Noise, v=Volume only V=Volume
; N=17bit to 9bit poly-counter
; 1234=Clocks and Joins
;   1 Channel 1 clock to 1.79Mhz
;   2 Channel 3 clock to 1.79MHz
;   3 Join channels 1-2 16bit frequency
;   4 Join channels 3-4 16bit frequency
; HH=Channel 1, Channel 2 Highpass Filters
; S=64Khz to 15kHz
AUDCTL = $d208  ; N1234HHS
