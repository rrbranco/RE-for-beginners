tmp$ = 8
i$ = 8
my_abs	PROC
	movss	DWORD PTR [rsp+8], xmm0
	mov	eax, DWORD PTR i$[rsp]
	btr	eax, 31
	mov	DWORD PTR tmp$[rsp], eax
	movss	xmm0, DWORD PTR tmp$[rsp]
	ret	0
my_abs	ENDP
_TEXT	ENDS

tmp$ = 8
i$ = 8
set_sign PROC
	movss	DWORD PTR [rsp+8], xmm0
	mov	eax, DWORD PTR i$[rsp]
	bts	eax, 31
	mov	DWORD PTR tmp$[rsp], eax
	movss	xmm0, DWORD PTR tmp$[rsp]
	ret	0
set_sign ENDP

tmp$ = 8
i$ = 8
negate	PROC
	movss	DWORD PTR [rsp+8], xmm0
	mov	eax, DWORD PTR i$[rsp]
	btc	eax, 31
	mov	DWORD PTR tmp$[rsp], eax
	movss	xmm0, DWORD PTR tmp$[rsp]
	ret	0
negate	ENDP
