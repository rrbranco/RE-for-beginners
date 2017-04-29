$SG2752	DB	'%d, %d, %d', 0aH, 00H

_c$ = -12	; size = 4
_b$ = -8	; size = 4
_a$ = -4	; size = 4
_f1	PROC
	push	ebp
	mov	ebp, esp
	sub	esp, 12
	mov	DWORD PTR _a$[ebp], 1
	mov	DWORD PTR _b$[ebp], 2
	mov	DWORD PTR _c$[ebp], 3
	mov	esp, ebp
	pop	ebp
	ret	0
_f1	ENDP

_c$ = -12	; size = 4
_b$ = -8	; size = 4
_a$ = -4	; size = 4
_f2	PROC
	push	ebp
	mov	ebp, esp
	sub	esp, 12
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	mov	ecx, DWORD PTR _b$[ebp]
	push	ecx
	mov	edx, DWORD PTR _a$[ebp]
	push	edx
	push	OFFSET $SG2752 ; '%d, %d, %d'
	call	DWORD PTR __imp__printf
	add	esp, 16
	mov	esp, ebp
	pop	ebp
	ret	0
_f2	ENDP

_main	PROC
	push	ebp
	mov	ebp, esp
	call	_f1
	call	_f2
	xor	eax, eax
	pop	ebp
	ret	0
_main	ENDP
