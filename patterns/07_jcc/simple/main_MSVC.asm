_main	PROC
	push	ebp
	mov	ebp, esp
	push	2
	push	1
	call	_f_signed
	add	esp, 8
	push	2
	push	1
	call	_f_unsigned
	add	esp, 8
	xor	eax, eax
	pop	ebp
	ret	0
_main	ENDP
