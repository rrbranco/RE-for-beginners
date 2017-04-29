_inbuf$ = 8		; size = 4
_outbuf$ = 12		; size = 4
_memcpy_128 PROC
	push	esi
	mov	esi, DWORD PTR _inbuf$[esp]
	push	edi
	mov	edi, DWORD PTR _outbuf$[esp+4]
	add	edi, 10
	mov	ecx, 32
	rep movsd
	pop	edi
	pop	esi
	ret	0
_memcpy_128 ENDP
