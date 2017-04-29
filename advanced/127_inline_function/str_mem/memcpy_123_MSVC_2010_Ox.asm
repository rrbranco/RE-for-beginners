_inbuf$ = 8		; size = 4
_outbuf$ = 12		; size = 4
_memcpy_123 PROC
	push	esi
	mov	esi, DWORD PTR _inbuf$[esp]
	push	edi
	mov	edi, DWORD PTR _outbuf$[esp+4]
	add	edi, 10	
	mov	ecx, 30	
	rep movsd
	movsw
	movsb
	pop	edi
	pop	esi
	ret	0
_memcpy_123 ENDP
