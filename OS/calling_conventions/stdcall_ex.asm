_a$ = 8		; size = 4
_b$ = 12	; size = 4
_c$ = 16	; size = 4
_f2@12	PROC
	push	ebp
	mov	ebp, esp
	mov	eax, DWORD PTR _a$[ebp]
	imul	eax, DWORD PTR _b$[ebp]
	add	eax, DWORD PTR _c$[ebp]
	pop	ebp
	ret	12
_f2@12	ENDP

; ...
	push	3
	push	2
	push	1
	call	_f2@12
	push	eax
	push	OFFSET $SG81369
	call	_printf
	add	esp, 8
