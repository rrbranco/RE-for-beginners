_f_mul:
	push	ebx
	mov	edx, DWORD PTR [esp+8]
	mov	eax, DWORD PTR [esp+16]
	mov	ebx, DWORD PTR [esp+12]
	mov	ecx, DWORD PTR [esp+20]
	imul	ebx, eax
	imul	ecx, edx
	mul	edx
	add	ecx, ebx
	add	edx, ecx
	pop	ebx
	ret

_f_div:
	sub	esp, 28
	mov	eax, DWORD PTR [esp+40]
	mov	edx, DWORD PTR [esp+44]
	mov	DWORD PTR [esp+8], eax
	mov	eax, DWORD PTR [esp+32]
	mov	DWORD PTR [esp+12], edx
	mov	edx, DWORD PTR [esp+36]
	mov	DWORD PTR [esp], eax
	mov	DWORD PTR [esp+4], edx
	call	___udivdi3 ; unsigned division 
	add	esp, 28
	ret

_f_rem:
	sub	esp, 28
	mov	eax, DWORD PTR [esp+40]
	mov	edx, DWORD PTR [esp+44]
	mov	DWORD PTR [esp+8], eax
	mov	eax, DWORD PTR [esp+32]
	mov	DWORD PTR [esp+12], edx
	mov	edx, DWORD PTR [esp+36]
	mov	DWORD PTR [esp], eax
	mov	DWORD PTR [esp+4], edx
	call	___umoddi3 ; unsigned modulo 
	add	esp, 28
	ret
