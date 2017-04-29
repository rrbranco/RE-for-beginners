swap_bytes:
	push	ebx
	mov	edx, DWORD PTR [esp+8]
	mov	eax, DWORD PTR [esp+12]
	movzx	ecx, BYTE PTR [edx]
	movzx	ebx, BYTE PTR [eax]
	mov	BYTE PTR [edx], bl
	mov	BYTE PTR [eax], cl
	pop	ebx
	ret

