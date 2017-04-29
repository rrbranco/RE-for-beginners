toupper:
	push	rbp
	mov	rbp, rsp
	mov	eax, edi
	mov	BYTE PTR [rbp-4], al
	cmp	BYTE PTR [rbp-4], 96
	jle	.L2
	cmp	BYTE PTR [rbp-4], 122
	jg	.L2
	movzx	eax, BYTE PTR [rbp-4]
	sub	eax, 32
	jmp	.L3
.L2:
	movzx	eax, BYTE PTR [rbp-4]
.L3:
	pop	rbp
	ret
