_next$ = -4	; size = 4
_a$ = 8		; size = 4
_b$ = 12	; size = 4
_limit$ = 16	; size = 4
_fib	PROC
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	eax, DWORD PTR _a$[ebp]
	add	eax, DWORD PTR _b$[ebp]
	mov	DWORD PTR _next$[ebp], eax
	mov	ecx, DWORD PTR _next$[ebp]
	push	ecx
	push	OFFSET $SG2751 ; '%d'
	call	DWORD PTR __imp__printf
	add	esp, 8
	mov	edx, DWORD PTR _next$[ebp]
	cmp	edx, DWORD PTR _limit$[ebp]
	jle	SHORT $LN1@fib
	jmp	SHORT $LN2@fib
$LN1@fib:
	mov	eax, DWORD PTR _limit$[ebp]
	push	eax
	mov	ecx, DWORD PTR _next$[ebp]
	push	ecx
	mov	edx, DWORD PTR _b$[ebp]
	push	edx
	call	_fib
	add	esp, 12
$LN2@fib:
	mov	esp, ebp
	pop	ebp
	ret	0
_fib	ENDP

_main	PROC
	push	ebp
	mov	ebp, esp
	push	OFFSET $SG2753 ; "0\n1\n1\n"
	call	DWORD PTR __imp__printf
	add	esp, 4
	push	20
	push	1
	push	1
	call	_fib
	add	esp, 12
	xor	eax, eax
	pop	ebp
	ret	0
_main	ENDP
