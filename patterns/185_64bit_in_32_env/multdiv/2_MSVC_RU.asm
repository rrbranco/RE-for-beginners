_a$ = 8 ; size = 8
_b$ = 16 ; size = 8
_f_mul	PROC
	push	ebp
	mov	ebp, esp
	mov	eax, DWORD PTR _b$[ebp+4]
	push	eax
	mov	ecx, DWORD PTR _b$[ebp]
	push	ecx
	mov	edx, DWORD PTR _a$[ebp+4]
	push	edx
	mov	eax, DWORD PTR _a$[ebp]
	push	eax
	call	__allmul ; long long multiplication (§умножение§ §значений§ §типа§ long long)
	pop	ebp
	ret	0
_f_mul	ENDP

_a$ = 8 ; size = 8
_b$ = 16 ; size = 8
_f_div	PROC
	push	ebp
	mov	ebp, esp
	mov	eax, DWORD PTR _b$[ebp+4]
	push	eax
	mov	ecx, DWORD PTR _b$[ebp]
	push	ecx
	mov	edx, DWORD PTR _a$[ebp+4]
	push	edx
	mov	eax, DWORD PTR _a$[ebp]
	push	eax
	call	__aulldiv ; unsigned long long division (§деление§ §беззнаковых§ §значений§ §типа§ long long)
	pop	ebp
	ret	0
_f_div	ENDP

_a$ = 8 ; size = 8
_b$ = 16 ; size = 8
_f_rem	PROC
	push	ebp
	mov	ebp, esp
	mov	eax, DWORD PTR _b$[ebp+4]
	push	eax
	mov	ecx, DWORD PTR _b$[ebp]
	push	ecx
	mov	edx, DWORD PTR _a$[ebp+4]
	push	edx
	mov	eax, DWORD PTR _a$[ebp]
	push	eax
	call	__aullrem ; unsigned long long remainder (§вычисление§ §беззнакового§ §остатка§)
	pop	ebp
	ret	0
_f_rem	ENDP
