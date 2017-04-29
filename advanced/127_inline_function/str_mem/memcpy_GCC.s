memcpy_123:
.LFB3:
	push	edi
	mov	eax, 123
	push	esi
	mov	edx, DWORD PTR [esp+16]
	mov	esi, DWORD PTR [esp+12]
	lea	edi, [edx+10]
	test	edi, 1
	jne	.L24
	test	edi, 2
	jne	.L25
.L7:
	mov	ecx, eax
	xor	edx, edx
	shr	ecx, 2
	test	al, 2
	rep movsd
	je	.L8
	movzx	edx, WORD PTR [esi]
	mov	WORD PTR [edi], dx
	mov	edx, 2
.L8:
	test	al, 1
	je	.L5
	movzx	eax, BYTE PTR [esi+edx]
	mov	BYTE PTR [edi+edx], al
.L5:
	pop	esi
	pop	edi
	ret
.L24:
	movzx	eax, BYTE PTR [esi]
	lea	edi, [edx+11]
	add	esi, 1
	test	edi, 2
	mov	BYTE PTR [edx+10], al
	mov	eax, 122
	je	.L7
.L25:
	movzx	edx, WORD PTR [esi]
	add	edi, 2
	add	esi, 2
	sub	eax, 2
	mov	WORD PTR [edi-2], dx
	jmp	.L7
.LFE3:

