_inbuf$ = 8	; size = 4
_outbuf$ = 12	; size = 4
_memcpy_7 PROC
	mov	ecx, DWORD PTR _inbuf$[esp-4]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _outbuf$[esp-4]
	mov	DWORD PTR [eax+10], edx
	mov	dx, WORD PTR [ecx+4]
	mov	WORD PTR [eax+14], dx
	mov	cl, BYTE PTR [ecx+6]
	mov	BYTE PTR [eax+16], cl
	ret	0
_memcpy_7 ENDP
