f:
	; EDI - erstes Argument
	; ESI - zweites Argument
	; EDX - drittes Argument
	imul	esi, edi
	lea	eax, [rdx+rsi]
	ret

main:
	sub	rsp, 8
	mov	edx, 3
	mov	esi, 2
	mov	edi, 1
	call	f
	mov	edi, OFFSET FLAT:.LC0 ; "%d\n"
	mov	esi, eax
	xor	eax, eax  ; Zahl der übergebenen Vector Register
	call	printf
	xor	eax, eax
	add	rsp, 8
	ret
