month$ = 8
get_month2 PROC
	mov	DWORD PTR [rsp+8], ecx
	movsxd	rax, DWORD PTR month$[rsp]
; RAX = Eingabewert um Vorzeichen und auf 64 Bit erweitern
	imul	rax, rax, 10
; RAX = RAX*10
	lea	rcx, OFFSET FLAT:month2
; RCX = Pointer auf die Tabelle
	add	rcx, rax
; RCX = RCX+RAX = Pointer auf die Tabelle+Monat*10
	mov	rax, rcx
; RAX = Pointer auf die Tabelle+Monat*10
	mov	ecx, 1
; RCX = 1
	imul	rcx, rcx, 0
; RCX = 1*0 = 0
	add	rax, rcx
; RAX = Pointer auf die Tabelle+Monat*10 + 0 = Pointer auf die Tabelle+Monat*10
	ret	0
get_month2 ENDP

