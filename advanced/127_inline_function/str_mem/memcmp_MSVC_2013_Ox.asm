_buf1$ = 8	; size = 4
_buf2$ = 12	; size = 4
_memcmp_1235 PROC
	mov	ecx, DWORD PTR _buf1$[esp-4]
	mov	edx, DWORD PTR _buf2$[esp-4]
	push	esi
	mov	esi, 1231
	npad	2
$LL5@memcmp_123:
	mov	eax, DWORD PTR [ecx]
	cmp	eax, DWORD PTR [edx]
	jne	SHORT $LN4@memcmp_123
	add	ecx, 4
	add	edx, 4
	sub	esi, 4
	jae	SHORT $LL5@memcmp_123
$LN4@memcmp_123:
	mov	al, BYTE PTR [ecx]
	cmp	al, BYTE PTR [edx]
	jne	SHORT $LN6@memcmp_123
	mov	al, BYTE PTR [ecx+1]
	cmp	al, BYTE PTR [edx+1]
	jne	SHORT $LN6@memcmp_123
	mov	al, BYTE PTR [ecx+2]
	cmp	al, BYTE PTR [edx+2]
	jne	SHORT $LN6@memcmp_123
	cmp	esi, -1
	je	SHORT $LN3@memcmp_123
	mov	al, BYTE PTR [ecx+3]
	cmp	al, BYTE PTR [edx+3]
	jne	SHORT $LN6@memcmp_123
$LN3@memcmp_123:
	xor	eax, eax
	pop	esi
	ret	0
$LN6@memcmp_123:
	sbb	eax, eax
	or	eax, 1
	pop	esi
	ret	0
_memcmp_1235 ENDP
