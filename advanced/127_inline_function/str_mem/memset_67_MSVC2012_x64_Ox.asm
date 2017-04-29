out$ = 8
f	PROC
	xor	eax, eax
	mov	QWORD PTR [rcx], rax
	mov	QWORD PTR [rcx+8], rax
	mov	QWORD PTR [rcx+16], rax
	mov	QWORD PTR [rcx+24], rax
	mov	QWORD PTR [rcx+32], rax
	mov	QWORD PTR [rcx+40], rax
	mov	QWORD PTR [rcx+48], rax
	mov	QWORD PTR [rcx+56], rax
	mov	WORD PTR [rcx+64], ax
	mov	BYTE PTR [rcx+66], al
	ret	0
f	ENDP
