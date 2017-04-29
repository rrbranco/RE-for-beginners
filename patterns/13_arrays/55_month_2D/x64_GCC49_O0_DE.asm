get_month2:
	push	rbp
	mov	rbp, rsp
	mov	DWORD PTR [rbp-4], edi
	mov	eax, DWORD PTR [rbp-4]
	movsx	rdx, eax
; RDX = erweitere Eingabewert um Vorzeichen
	mov	rax, rdx
; RAX = Monat
	sal	rax, 2
; RAX = Monat<<2 = Monat*4
	add	rax, rdx
; RAX = RAX+RDX = Monat*4+Monat = Monat*5
	add	rax, rax
; RAX = RAX*2 = Monat*5*2 = Monat*10
	add	rax, OFFSET FLAT:month2
; RAX = Monat*10 + Pointer auf die Tabelle
	pop	rbp
	ret
