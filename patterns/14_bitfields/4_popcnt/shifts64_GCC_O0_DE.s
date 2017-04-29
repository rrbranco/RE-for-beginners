f:
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR [rbp-24], rdi	; a
	mov	DWORD PTR [rbp-12], 0	; rt=0
	mov	QWORD PTR [rbp-8], 0	; i=0
	jmp	.L2
.L4:
	mov	rax, QWORD PTR [rbp-8]
	mov	rdx, QWORD PTR [rbp-24]
; RAX = i, RDX = a
	mov	ecx, eax
; ECX = i
	shr	rdx, cl
; RDX = RDX>>CL = a>>i
	mov	rax, rdx
; RAX = RDX = a>>i
	and	eax, 1
; EAX = EAX&1 = (a>>i)&1
	test	rax, rax
; ist das letzte Bit 0?
; überspringe nächsten ADD Befehl, wenn es so war.
	je	.L3	
	add	DWORD PTR [rbp-12], 1	; rt++
.L3:
	add	QWORD PTR [rbp-8], 1	; i++
.L2:
	cmp	QWORD PTR [rbp-8], 63	; i<63?
	jbe	.L4			; springe zum Beginn der Schleife, falls wahr
	mov	eax, DWORD PTR [rbp-12]	; return rt
	pop	rbp
	ret
