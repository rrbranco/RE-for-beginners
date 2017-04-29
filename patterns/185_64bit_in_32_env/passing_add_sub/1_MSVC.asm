_a$ = 8		; size = 8
_b$ = 16	; size = 8
_f_add	PROC
	mov	eax, DWORD PTR _a$[esp-4]
	add	eax, DWORD PTR _b$[esp-4]
	mov	edx, DWORD PTR _a$[esp]
	adc	edx, DWORD PTR _b$[esp]
	ret	0
_f_add	ENDP

_f_add_test PROC
	push	5461		; 00001555H
	push	1972608889	; 75939f79H
	push	2874		; 00000b3aH
	push	1942892530	; 73ce2ff_subH
	call	_f_add
	push	edx
	push	eax
	push	OFFSET $SG1436 ; '%I64d', 0aH, 00H
	call	_printf
	add	esp, 28
	ret	0
_f_add_test ENDP

_f_sub	PROC
	mov	eax, DWORD PTR _a$[esp-4]
	sub	eax, DWORD PTR _b$[esp-4]
	mov	edx, DWORD PTR _a$[esp]
	sbb	edx, DWORD PTR _b$[esp]
	ret	0
_f_sub	ENDP
