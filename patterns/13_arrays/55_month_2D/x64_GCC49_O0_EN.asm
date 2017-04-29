get_month2:
	push	rbp
	mov	rbp, rsp
	mov	DWORD PTR [rbp-4], edi
	mov	eax, DWORD PTR [rbp-4]
	movsx	rdx, eax
; RDX = sign-extended input value
	mov	rax, rdx
; RAX = month
	sal	rax, 2
; RAX = month<<2 = month*4
	add	rax, rdx
; RAX = RAX+RDX = month*4+month = month*5
	add	rax, rax
; RAX = RAX*2 = month*5*2 = month*10
	add	rax, OFFSET FLAT:month2
; RAX = month*10 + pointer to the table
	pop	rbp
	ret
