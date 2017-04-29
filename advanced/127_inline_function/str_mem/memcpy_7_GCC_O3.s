memcpy_7:
	push	ebx
	mov	eax, DWORD PTR [esp+8]
	mov	ecx, DWORD PTR [esp+12]
	mov	ebx, DWORD PTR [eax]
	lea	edx, [ecx+10]
	mov	DWORD PTR [ecx+10], ebx
	movzx	ecx, WORD PTR [eax+4]
	mov	WORD PTR [edx+4], cx
	movzx	eax, BYTE PTR [eax+6]
	mov	BYTE PTR [edx+6], al
	pop	ebx
	ret
