get_month2:
	push	rbp
	mov	rbp, rsp
	mov	DWORD PTR [rbp-4], edi
	mov	eax, DWORD PTR [rbp-4]
	movsx	rdx, eax
; RDX = входное значение, расширенное учитывая знак
	mov	rax, rdx
; RAX = месяц
	sal	rax, 2
; RAX = месяц<<2 = месяц*4
	add	rax, rdx
; RAX = RAX+RDX = §месяц§*4+§месяц§ = §месяц§*5
	add	rax, rax
; RAX = RAX*2 = §месяц§*5*2 = §месяц§*10
	add	rax, OFFSET FLAT:month2
; RAX = §месяц§*10 + указатель на таблицу
	pop	rbp
	ret
