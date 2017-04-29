_a$ = 8			; size = 4
_b$ = 12		; size = 4
_limit$ = 16		; size = 4
_fib	PROC
	push	ebp
	mov	ebp, esp
	mov	eax, DWORD PTR _a$[ebp]
	add	eax, DWORD PTR _b$[ebp]
	push	eax
	push	OFFSET $SG2643
	call	DWORD PTR __imp__printf
	add	esp, 8
	mov	ecx, DWORD PTR _a$[ebp]
	add	ecx, DWORD PTR _b$[ebp]
	cmp	ecx, DWORD PTR _limit$[ebp]
	jle	SHORT $LN1@fib
	jmp	SHORT $LN2@fib
$LN1@fib:
	mov	edx, DWORD PTR _limit$[ebp]
	push	edx
	mov	eax, DWORD PTR _a$[ebp]
	add	eax, DWORD PTR _b$[ebp]
	push	eax
	mov	ecx, DWORD PTR _b$[ebp]
	push	ecx
	call	_fib
	add	esp, 12
$LN2@fib:
	pop	ebp
	ret	0
_fib	ENDP

_main	PROC
	push	ebp
	mov	ebp, esp
	push	OFFSET $SG2647 ; "0\n1\n1\n"
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
