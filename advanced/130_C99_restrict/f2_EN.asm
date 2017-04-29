f2:
	push	r13 r12 rbp rdi rsi rbx
	mov	r13, QWORD PTR 104[rsp]
	mov	rbp, QWORD PTR 88[rsp]
	mov	r12, QWORD PTR 96[rsp]
	test	r13, r13
	je	.L7
	add	r13, 1
	xor	r10d, r10d
	mov	edi, 1
	xor	eax, eax
	jmp	.L10
.L11:
	mov	rax, rdi
	mov	rdi, r11
.L10:
	mov	esi, DWORD PTR [rcx+rax*4]
	mov	r11d, DWORD PTR [rdx+rax*4]
	mov	DWORD PTR [r12+rax*4], r10d  ; store to update_me[]
	add	r10d, 123
	lea	ebx, [rsi+r11]
	imul	r11d, esi
	mov	DWORD PTR [r8+rax*4], ebx    ; store to sum[]
	mov	DWORD PTR [r9+rax*4], r11d   ; store to product[]
	add	r11d, ebx
	mov	DWORD PTR 0[rbp+rax*4], r11d ; store to sum_product[]
	lea	r11, 1[rdi]
	cmp	r11, r13
	jne	.L11
.L7:
	pop	rbx rsi rdi rbp r12 r13
	ret
