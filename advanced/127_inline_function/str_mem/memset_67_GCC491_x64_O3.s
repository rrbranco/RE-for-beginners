f:
	mov	QWORD PTR [rdi], 0
	mov	QWORD PTR [rdi+59], 0
	mov	rcx, rdi
	lea	rdi, [rdi+8]
	xor	eax, eax
	and	rdi, -8
	sub	rcx, rdi
	add	ecx, 67
	shr	ecx, 3
	rep stosq
	ret
