f1:
	push	r15 r14 r13 r12 rbp rdi rsi rbx
	mov	r13, QWORD PTR 120[rsp]
	mov	rbp, QWORD PTR 104[rsp]
	mov	r12, QWORD PTR 112[rsp]
	test	r13, r13
	je	.L1
	add	r13, 1
	xor	ebx, ebx
	mov	edi, 1
	xor	r11d, r11d
	jmp	.L4
.L6:
	mov	r11, rdi
	mov	rdi, rax
.L4:
	lea	rax, 0[0+r11*4]
	lea	r10, [rcx+rax]
	lea	r14, [rdx+rax]
	lea	rsi, [r8+rax]
	add	rax, r9
	mov	r15d, DWORD PTR [r10]
	add	r15d, DWORD PTR [r14]
	mov	DWORD PTR [rsi], r15d         ; store to sum[]
	mov	r10d, DWORD PTR [r10]
	imul	r10d, DWORD PTR [r14]
	mov	DWORD PTR [rax], r10d         ; store to product[]
	mov	DWORD PTR [r12+r11*4], ebx    ; store to update_me[]
	add	ebx, 123
	mov	r10d, DWORD PTR [rsi]         ; reload sum[i]
	add	r10d, DWORD PTR [rax]         ; reload product[i]
	lea	rax, 1[rdi]
	cmp	rax, r13
	mov	DWORD PTR 0[rbp+r11*4], r10d  ; store to sum_product[]
	jne	.L6
.L1:
	pop	rbx rsi rdi rbp r12 r13 r14 r15
	ret
