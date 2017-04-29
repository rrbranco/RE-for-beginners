month$ = 8
get_month2 PROC
	mov	DWORD PTR [rsp+8], ecx
	movsxd	rax, DWORD PTR month$[rsp]
; RAX = sign-extended input value into 64-bit one
	imul	rax, rax, 10
; RAX = RAX*10
	lea	rcx, OFFSET FLAT:month2
; RCX = pointer to the table
	add	rcx, rax
; RCX = RCX+RAX = pointer to the table+month*10
	mov	rax, rcx
; RAX = pointer to the table+month*10
	mov	ecx, 1
; RCX = 1
	imul	rcx, rcx, 0
; RCX = 1*0 = 0
	add	rax, rcx
; RAX = pointer to the table+month*10 + 0 = pointer to the table+month*10
	ret	0
get_month2 ENDP

