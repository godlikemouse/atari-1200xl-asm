; sound.asm
;	Background music and sound effect functionality

;
; setup sound system
;
.proc setup_sound
	mva #0 BGM_COUNTER
	mva #0 BGM_DATA_INDEX
	mva #1 BGM_ENABLE

	mwa #background_music BGM_ADDRL

	;N1234HHS
	mva #%00000000 AUDCTL
	rts
.endp

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
	mva (BGM_ADDRL),y FREQCTRL

	; load audio control
	iny
	mva (BGM_ADDRL),y CHANNEL

	; load note sustain
	iny
	mva (BGM_ADDRL),y BGM_NOTE_SUSTAIN

	; load note silence interval
	iny
	mva (BGM_ADDRL),y BGM_NOTE_SILENCE

	; prepare next note
	iny
	sty BGM_DATA_INDEX

	lda (BGM_ADDRL),y
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
; render sfx
; 	render sound effects
.macro render_sfx reg, ctrl
SFX=:reg
SOUND=:reg+1
COUNTER=:reg+3
INDEX=:reg+4
SUSTAIN=:reg+5
SILENCE=:reg+6
FREQCTRL=:ctrl
CHANNEL=:ctrl+1

	; play sfx?
	lda SFX
	cmp #1
	bne done

	inc COUNTER
	ldx COUNTER

	cpx SUSTAIN ; note sustain
	bcc note_still_playing
	mva #0 CHANNEL ; mute
note_still_playing
	cpx SILENCE ; silence between notes
	bcs play_note
	jmp done
play_note
	mva #0 COUNTER
	ldy INDEX

	; verify not at end
	lda (SOUND),y
	cmp #0
	beq complete

	; verify not silence
	cmp #1
	bne continue_play_note

	; mute channel for silence
	mva #0 CHANNEL
	iny
	jmp continue_sustain

continue_play_note
	mva (SOUND),y FREQCTRL

	; load audio control
	iny
	mva (SOUND),y CHANNEL

continue_sustain
	; load note sustain
	iny
	mva (SOUND),y SUSTAIN

	; load note silence interval
	iny
	mva (SOUND),y SILENCE

	; prepare next note
	iny
	sty INDEX
	jmp done

complete
	mva #0 CHANNEL
	mva #0 COUNTER
	mva #0 INDEX
	mva #0 SFX

done

.endm

;
; play key pickup sound
;
.proc play_key_sound
	lda #0
	sta SFX1_COUNTER
	sta SFX1_DATA_INDEX
	mwa #key_pickup_sfx SFX1_ADDRL
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
	mwa #gameover_sfx SFX1_ADDRL
	mva #1 SFX1
	rts
.endp
