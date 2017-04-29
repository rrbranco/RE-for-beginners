$SG2796	DB	'%d', 0aH, 00H

_a$ = 8
_f	PROC
	lea	eax, DWORD PTR _a$[esp-4] ; just get the address of value in local stack
	push	eax                       ; and pass it to modify_a()
	call	_modify_a
	mov	ecx, DWORD PTR _a$[esp]   ; reload it from the local stack
	push	ecx                       ; and pass it to printf()
	push	OFFSET $SG2796 ; '%d'
	call	_printf
	add	esp, 12
	ret	0
_f	ENDP
