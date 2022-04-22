; sound.asm
;	Background music and sound effect functionality

;
; render background music
;
.proc render_background_music
FREQCTRL=AF4C
CHANNEL=FREQCTRL+1

	lda BGM_ENABLE
	cmp #1
	bne done

	inc BGM_COUNTER
	ldx BGM_COUNTER

	cpx BGM_NOTE_SUSTAIN ; note sustain
	bcc note_still_playing
	mva #0 CHANNEL ; mute

note_still_playing
	cpx BGM_NOTE_SILENCE ; silence between notes
	bcs play_note
	jmp done

play_note
	mva #0 BGM_COUNTER
	ldy BGM_DATA_INDEX
	mva (BGM_ADDR),y FREQCTRL

	; load audio control
	iny
	mva (BGM_ADDR),y CHANNEL

	; load note sustain
	iny
	mva (BGM_ADDR),y BGM_NOTE_SUSTAIN

	; load note silence interval
	iny
	mva (BGM_ADDR),y BGM_NOTE_SILENCE

	; prepare next note
	iny
	sty BGM_DATA_INDEX

	lda (BGM_ADDR),y
	cmp #0 ; end play
	bne done

	mva #0 BGM_DATA_INDEX

done
	rts
.endp

;
; stop background music
;
.proc stop_background_music
FREQCTRL=AF4C
CHANNEL=FREQCTRL+1
	lda #0
	sta BGM_ENABLE
	sta CHANNEL
	rts
.endp

;
; enable background music
;
.proc play_background_music
	mva #0 BGM_COUNTER
	mva #0 BGM_DATA_INDEX
	mva #1 BGM_ENABLE
	rts
.endp

;
; play key pickup sound
;
.proc play_key_sound
	lda #0
	sta SFX1_COUNTER
	sta SFX1_DATA_INDEX
	mwa #key_pickup_sfx SFX1_ADDR
	mva #1 SFX1
	rts
.endp

;
; play chest pickup sound
;
.proc play_chest_sound
	lda #0
	sta SFX1_COUNTER
	sta SFX1_DATA_INDEX
	mwa #chest_pickup_sfx SFX1_ADDR
	mva #1 SFX1
	rts
.endp

;
; play chest pickup sound
;
.proc play_coin_sound
	lda #0
	sta SFX1_COUNTER
	sta SFX1_DATA_INDEX
	mwa #coin_pickup_sfx SFX1_ADDR
	mva #1 SFX1
	rts
.endp

;
; play door open sound
;
.proc play_door_open_sound
	lda #0
	sta SFX1_COUNTER
	sta SFX1_DATA_INDEX
	mwa #door_open_sfx SFX1_ADDR
	mva #1 SFX1
	rts
.endp

;
; play exit level sound
;
.proc play_exit_level_sound
	lda #0
	sta SFX1_COUNTER
	sta SFX1_DATA_INDEX
	mwa #exit_level_sfx SFX1_ADDR
	mva #1 SFX1
	rts
.endp

;
; play game over sound
;
.proc play_gameover_sound
	lda #0
	sta SFX1_COUNTER
	sta SFX1_DATA_INDEX
	mwa #gameover_sfx SFX1_ADDR
	mva #1 SFX1
	rts
.endp

;
; play menu item sound
;
.proc play_mainmenu_item_sound
	lda #0
	sta SFX1_COUNTER
	sta SFX1_DATA_INDEX
	mwa #mainmenu_item_sfx SFX1_ADDR
	mva #1 SFX1
	rts
.endp

;
; render sfx
; 	render sound effects
.proc render_sfx (.byte regl+1, regh+1, ctrll+1, ctrlh+1) .var
regl mva #0 TMP0
regh mva #0 TMP1
ctrll mva #0 TMP2
ctrlh mva #0 TMP3

SFX=TMP0
FREQCTRL=TMP2
SOUND=TMP4
COUNTER=TMP6
INDEX=TMP8
SUSTAIN=TMP10
SILENCE=TMP12
CHANNEL=TMP14

	; adjust offsets
	mwa SFX SOUND
	mwa SFX COUNTER
	mwa SFX INDEX
	mwa SFX SUSTAIN
	mwa SFX SILENCE
	mwa FREQCTRL CHANNEL

	adw SOUND #1
	adw COUNTER #3
	adw INDEX #4
	adw SUSTAIN #5
	adw SILENCE #6
	adw CHANNEL #1

    ; dereference sound pointer and update local reference
    ldy #0
    lda (SOUND),y
    tax
    iny
    lda (SOUND),y
    sta SOUND+1
    txa
    sta SOUND

	; play sfx?
	ldy #0
	lda (SFX),y
	cmp #1
	bne exit
	jmp continue

exit
	rts

continue
	lda (INDEX),y
	cmp #0
	beq play_note

	adb (COUNTER),y #1
	cmp (SUSTAIN),y ; note sustain
	bcc note_still_playing
	mva #0 (CHANNEL),y ; mute

note_still_playing

    lda (COUNTER),y
	cmp (SILENCE),y ; silence between notes
	bcs play_note
	jmp done

play_note
	mva #0 (COUNTER),y
	lda (INDEX),y
	tay

	; verify not at end
	lda (SOUND),y
	cmp #0
	beq complete

	; verify not silence
	cmp #1
	bne continue_play_note

	; mute channel for silence
	ldy #0
	mva #0 (CHANNEL),y
	adb (INDEX),y #1
	jmp continue_sustain

continue_play_note

	ldy #0
	lda (INDEX),y
	tay

	lda (SOUND),y
	ldy #0
	sta (FREQCTRL),y

	; load audio control
	adb (INDEX),y #1
	tay
	lda (SOUND),y
	ldy #0
	sta (CHANNEL),y

continue_sustain

	adb (INDEX),y #1
	tay

	; load note sustain
	lda (SOUND),y
	ldy #0
	sta (SUSTAIN),y

	; load note silence interval
	adb (INDEX),y #1
	lda (INDEX),y
	tay
	lda (SOUND),y
	ldy #0
	sta (SILENCE),y

	; prepare next note
	adb (INDEX),y #1
	jmp done

complete
	ldy #0
	mva #0 (CHANNEL),y
	mva #0 (COUNTER),y
	mva #0 (INDEX),y
	mva #0 (SFX),y

done
	rts
.endp
