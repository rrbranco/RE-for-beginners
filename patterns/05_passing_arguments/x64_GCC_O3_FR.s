f:
	; EDI - 1er argument
	; ESI - §2ème argument§
	; EDX - §3ème argument§
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
	xor	eax, eax  ; §nombre de registres vectoriel passés§
	call	printf
	xor	eax, eax
	add	rsp, 8
	ret
