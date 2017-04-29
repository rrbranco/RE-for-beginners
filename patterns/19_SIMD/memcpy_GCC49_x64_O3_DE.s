my_memcpy:
; RDI = destination address
; RSI = source address
; RDX = size of block
	test	rdx, rdx
	je	.L41
	lea	rax, [rdi+16]
	cmp	rsi, rax
	lea	rax, [rsi+16]
	setae	cl
	cmp	rdi, rax
	setae	al
	or	cl, al
	je	.L13
	cmp	rdx, 22
	jbe	.L13
	mov	rcx, rsi
	push	rbp
	push	rbx
	neg	rcx
	and	ecx, 15
	cmp	rcx, rdx
	cmova	rcx, rdx
	xor	eax, eax
	test	rcx, rcx
	je	.L4
	movzx	eax, BYTE PTR [rsi]
	cmp	rcx, 1
	mov	BYTE PTR [rdi], al
	je	.L15
	movzx	eax, BYTE PTR [rsi+1]
	cmp	rcx, 2
	mov	BYTE PTR [rdi+1], al
	je	.L16
	movzx	eax, BYTE PTR [rsi+2]
	cmp	rcx, 3
	mov	BYTE PTR [rdi+2], al
	je	.L17
	movzx	eax, BYTE PTR [rsi+3]
	cmp	rcx, 4
	mov	BYTE PTR [rdi+3], al
	je	.L18
	movzx	eax, BYTE PTR [rsi+4]
	cmp	rcx, 5
	mov	BYTE PTR [rdi+4], al
	je	.L19
	movzx	eax, BYTE PTR [rsi+5]
	cmp	rcx, 6
	mov	BYTE PTR [rdi+5], al
	je	.L20
	movzx	eax, BYTE PTR [rsi+6]
	cmp	rcx, 7
	mov	BYTE PTR [rdi+6], al
	je	.L21
	movzx	eax, BYTE PTR [rsi+7]
	cmp	rcx, 8
	mov	BYTE PTR [rdi+7], al
	je	.L22
	movzx	eax, BYTE PTR [rsi+8]
	cmp	rcx, 9
	mov	BYTE PTR [rdi+8], al
	je	.L23
	movzx	eax, BYTE PTR [rsi+9]
	cmp	rcx, 10
	mov	BYTE PTR [rdi+9], al
	je	.L24
	movzx	eax, BYTE PTR [rsi+10]
	cmp	rcx, 11
	mov	BYTE PTR [rdi+10], al
	je	.L25
	movzx	eax, BYTE PTR [rsi+11]
	cmp	rcx, 12
	mov	BYTE PTR [rdi+11], al
	je	.L26
	movzx	eax, BYTE PTR [rsi+12]
	cmp	rcx, 13
	mov	BYTE PTR [rdi+12], al
	je	.L27
	movzx	eax, BYTE PTR [rsi+13]
	cmp	rcx, 15
	mov	BYTE PTR [rdi+13], al
	jne	.L28
	movzx	eax, BYTE PTR [rsi+14]
	mov	BYTE PTR [rdi+14], al
	mov	eax, 15
.L4:
	mov	r10, rdx
	lea	r9, [rdx-1]
	sub	r10, rcx
	lea	r8, [r10-16]
	sub	r9, rcx
	shr	r8, 4
	add	r8, 1
	mov	r11, r8
	sal	r11, 4
	cmp	r9, 14
	jbe	.L6
	lea	rbp, [rsi+rcx]
	xor	r9d, r9d
	add	rcx, rdi
	xor	ebx, ebx
.L7:
	movdqa	xmm0, XMMWORD PTR [rbp+0+r9]
	add	rbx, 1
	movups	XMMWORD PTR [rcx+r9], xmm0
	add	r9, 16
	cmp	rbx, r8
	jb	.L7
	add	rax, r11
	cmp	r10, r11
	je	.L1
.L6:
	movzx	ecx, BYTE PTR [rsi+rax]
	mov	BYTE PTR [rdi+rax], cl
	lea	rcx, [rax+1]
	cmp	rdx, rcx
	jbe	.L1
	movzx	ecx, BYTE PTR [rsi+1+rax]
	mov	BYTE PTR [rdi+1+rax], cl
	lea	rcx, [rax+2]
	cmp	rdx, rcx
	jbe	.L1
	movzx	ecx, BYTE PTR [rsi+2+rax]
	mov	BYTE PTR [rdi+2+rax], cl
	lea	rcx, [rax+3]
	cmp	rdx, rcx
	jbe	.L1
	movzx	ecx, BYTE PTR [rsi+3+rax]
	mov	BYTE PTR [rdi+3+rax], cl
	lea	rcx, [rax+4]
	cmp	rdx, rcx
	jbe	.L1
	movzx	ecx, BYTE PTR [rsi+4+rax]
	mov	BYTE PTR [rdi+4+rax], cl
	lea	rcx, [rax+5]
	cmp	rdx, rcx
	jbe	.L1
	movzx	ecx, BYTE PTR [rsi+5+rax]
	mov	BYTE PTR [rdi+5+rax], cl
	lea	rcx, [rax+6]
	cmp	rdx, rcx
	jbe	.L1
	movzx	ecx, BYTE PTR [rsi+6+rax]
	mov	BYTE PTR [rdi+6+rax], cl
	lea	rcx, [rax+7]
	cmp	rdx, rcx
	jbe	.L1
	movzx	ecx, BYTE PTR [rsi+7+rax]
	mov	BYTE PTR [rdi+7+rax], cl
	lea	rcx, [rax+8]
	cmp	rdx, rcx
	jbe	.L1
	movzx	ecx, BYTE PTR [rsi+8+rax]
	mov	BYTE PTR [rdi+8+rax], cl
	lea	rcx, [rax+9]
	cmp	rdx, rcx
	jbe	.L1
	movzx	ecx, BYTE PTR [rsi+9+rax]
	mov	BYTE PTR [rdi+9+rax], cl
	lea	rcx, [rax+10]
	cmp	rdx, rcx
	jbe	.L1
	movzx	ecx, BYTE PTR [rsi+10+rax]
	mov	BYTE PTR [rdi+10+rax], cl
	lea	rcx, [rax+11]
	cmp	rdx, rcx
	jbe	.L1
	movzx	ecx, BYTE PTR [rsi+11+rax]
	mov	BYTE PTR [rdi+11+rax], cl
	lea	rcx, [rax+12]
	cmp	rdx, rcx
	jbe	.L1
	movzx	ecx, BYTE PTR [rsi+12+rax]
	mov	BYTE PTR [rdi+12+rax], cl
	lea	rcx, [rax+13]
	cmp	rdx, rcx
	jbe	.L1
	movzx	ecx, BYTE PTR [rsi+13+rax]
	mov	BYTE PTR [rdi+13+rax], cl
	lea	rcx, [rax+14]
	cmp	rdx, rcx
	jbe	.L1
	movzx	edx, BYTE PTR [rsi+14+rax]
	mov	BYTE PTR [rdi+14+rax], dl
.L1:
	pop	rbx
	pop	rbp
.L41:
	rep ret
.L13:
	xor	eax, eax
.L3:
	movzx	ecx, BYTE PTR [rsi+rax]
	mov	BYTE PTR [rdi+rax], cl
	add	rax, 1
	cmp	rax, rdx
	jne	.L3
	rep ret
.L28:
	mov	eax, 14
	jmp	.L4
.L15:
	mov	eax, 1
	jmp	.L4
.L16:
	mov	eax, 2
	jmp	.L4
.L17:
	mov	eax, 3
	jmp	.L4
.L18:
	mov	eax, 4
	jmp	.L4
.L19:
	mov	eax, 5
	jmp	.L4
.L20:
	mov	eax, 6
	jmp	.L4
.L21:
	mov	eax, 7
	jmp	.L4
.L22:
	mov	eax, 8
	jmp	.L4
.L23:
	mov	eax, 9
	jmp	.L4
.L24:
	mov	eax, 10
	jmp	.L4
.L25:
	mov	eax, 11
	jmp	.L4
.L26:
	mov	eax, 12
	jmp	.L4
.L27:
	mov	eax, 13
	jmp	.L4
