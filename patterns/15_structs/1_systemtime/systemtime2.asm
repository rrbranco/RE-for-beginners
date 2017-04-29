$SG78573 DB	'%04d-%02d-%02d %02d:%02d:%02d', 0aH, 00H

_array$ = -16	; size = 16
_main	PROC
	push	ebp
	mov	ebp, esp
	sub	esp, 16
	lea	eax, DWORD PTR _array$[ebp]
	push	eax
	call	DWORD PTR __imp__GetSystemTime@4
	movzx	ecx, WORD PTR _array$[ebp+12] ; wSecond
	push	ecx
	movzx	edx, WORD PTR _array$[ebp+10] ; wMinute
	push	edx
	movzx	eax, WORD PTR _array$[ebp+8] ; wHoure
	push	eax
	movzx	ecx, WORD PTR _array$[ebp+6] ; wDay
	push	ecx
	movzx	edx, WORD PTR _array$[ebp+2] ; wMonth
	push	edx
	movzx	eax, WORD PTR _array$[ebp] ; wYear
	push	eax
	push	OFFSET $SG78573
	call	_printf
	add	esp, 28
	xor	eax, eax
	mov	esp, ebp
	pop	ebp
	ret	0
_main	ENDP
