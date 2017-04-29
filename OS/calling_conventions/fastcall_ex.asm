_c$ = 8		; size = 4
@f3@12	PROC
; _a$ = ecx
; _b$ = edx
	mov	eax, ecx
	imul	eax, edx
	add	eax, DWORD PTR _c$[esp-4]
	ret	4
@f3@12	ENDP

; ...

	mov	edx, 2
	push	3
	lea	ecx, DWORD PTR [edx-1]
	call	@f3@12
	push	eax
	push	OFFSET $SG81390
	call	_printf
	add	esp, 8
