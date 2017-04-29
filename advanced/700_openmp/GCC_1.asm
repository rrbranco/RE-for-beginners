main._omp_fn.0:
	push	rbp
	mov	rbp, rsp
	push	rbx
	sub	rsp, 40
	mov	QWORD PTR [rbp-40], rdi
	call	omp_get_num_threads
	mov	ebx, eax
	call	omp_get_thread_num
	mov	esi, eax
	mov	eax, 2147483647 ; 0x7FFFFFFF
	cdq
	idiv	ebx
	mov	ecx, eax
	mov	eax, 2147483647 ; 0x7FFFFFFF
	cdq
	idiv	ebx
	mov	eax, edx
	cmp	esi, eax
	jl	.L15
.L18:
	imul	esi, ecx
	mov	edx, esi
	add	eax, edx
	lea	ebx, [rax+rcx]
	cmp	eax, ebx
	jge	.L14
	mov	DWORD PTR [rbp-20], eax
.L17:
	mov	eax, DWORD PTR [rbp-20]
	mov	edi, eax
	call	check_nonce
	add	DWORD PTR [rbp-20], 1
	cmp	DWORD PTR [rbp-20], ebx
	jl	.L17
	jmp	.L14
.L15:
	mov	eax, 0
	add	ecx, 1
	jmp	.L18
.L14:
	add	rsp, 40
	pop	rbx
	pop	rbp
	ret
