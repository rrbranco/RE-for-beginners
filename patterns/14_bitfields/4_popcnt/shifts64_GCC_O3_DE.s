f:
	xor	eax, eax	; rt liegt in EAX
	xor	ecx, ecx	; i liegt in ECX
.L3:
	mov	rsi, rdi	; lade Eingabewert
	lea	edx, [rax+1]	; EDX=EAX+1
; EDX enthält hier eine §\IT{neue Version von rt}§, 
; diese wird nach rt geschrieben, falls das letzte Bit 1 ist
	shr	rsi, cl		; RSI=RSI>>CL
	and	esi, 1		; ESI=ESI&1
; das letzte Bit ist 1? Falls ja, schreibe §\IT{neue Version von rt}§ nach EAX
	cmovne	eax, edx
	add	rcx, 1		; RCX++
	cmp	rcx, 64
	jne	.L3
	rep ret			; AKA fatret
