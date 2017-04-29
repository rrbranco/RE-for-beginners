_a$ = 8							; size = 4
_b$ = 12						; size = 4
_f	PROC
	push	ebp
	mov	ebp, esp
	mov	eax, DWORD PTR _a$[ebp]
	add	eax, DWORD PTR _b$[ebp]
	mov	DWORD PTR _a$[ebp], eax
	mov	ecx, DWORD PTR _a$[ebp]
	push	ecx
	push	OFFSET $SG2938 ; '%d', 0aH
	call	_printf
	add	esp, 8
	pop	ebp
	ret	0
_f	ENDP
