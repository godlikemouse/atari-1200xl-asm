; sound.asm
;	Background music and sound effect functionality

;
; setup sound system
;
.proc setup_sound
	mva #0 BGM_COUNTER
	mva #0 BGM_DATA_INDEX
	mva #1 BGM_ENABLE
	;N1234HHS
	mva #%00000000 AUDCTL
	rts
.endp

;
; play background music
;
.proc play_background_music
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
	ldx BGM_DATA_INDEX
	mva background_music,x FREQCTRL

	; load audio control
	inx
	mva background_music,x CHANNEL

	; load note sustain
	inx
	mva background_music,x BGM_NOTE_SUSTAIN

	; load note silence interval
	inx
	mva background_music,x BGM_NOTE_SILENCE

	; prepare next note
	inx
	stx BGM_DATA_INDEX

	lda background_music,x
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
; play sfx
; 	play sound effects
.macro play_sfx reg, ctrl
SFX=:reg
COUNTER=:reg+1
INDEX=:reg+2
SUSTAIN=:reg+3
SILENCE=:reg+4
FREQCTRL=:ctrl
CHANNEL=:ctrl+1

	; play sfx?
	lda SFX
	cmp #0
	beq done

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
	ldx INDEX
	mva key_pickup_sfx,x FREQCTRL

	; load audio control
	inx
	mva key_pickup_sfx,x CHANNEL

	; load note sustain
	inx
	mva key_pickup_sfx,x SUSTAIN

	; load note silence interval
	inx
	mva key_pickup_sfx,x SILENCE

	; prepare next note
	inx
	stx INDEX

	lda key_pickup_sfx,x
	cmp #0 ; end play
	bne done

	mva #0 CHANNEL
	mva #0 COUNTER
	mva #0 INDEX
	mva #0 SFX
done

.endm

.proc play_key_sound
	mva #0 SFX1_COUNTER
	mva #0 SFX1_DATA_INDEX
	mva #1 SFX1
	rts
.endp
