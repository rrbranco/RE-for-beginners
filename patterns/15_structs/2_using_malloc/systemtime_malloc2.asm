$SG78594 DB	'%04d-%02d-%02d %02d:%02d:%02d', 0aH, 00H

_main	PROC
	push	esi
	push	16
	call	_malloc
	add	esp, 4
	mov	esi, eax
	push	esi
	call	DWORD PTR __imp__GetSystemTime@4
	movzx	eax, WORD PTR [esi+12]
	movzx	ecx, WORD PTR [esi+10]
	movzx	edx, WORD PTR [esi+8]
	push	eax
	movzx	eax, WORD PTR [esi+6]
	push	ecx
	movzx	ecx, WORD PTR [esi+2]
	push	edx
	movzx	edx, WORD PTR [esi]
	push	eax
	push	ecx
	push	edx
	push	OFFSET $SG78594
	call	_printf
	push	esi
	call	_free
	add	esp, 32
	xor	eax, eax
	pop	esi
	ret	0
_main	ENDP
