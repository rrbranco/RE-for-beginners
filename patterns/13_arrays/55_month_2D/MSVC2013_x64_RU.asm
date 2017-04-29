month$ = 8
get_month2 PROC
	mov	DWORD PTR [rsp+8], ecx
	movsxd	rax, DWORD PTR month$[rsp]
; RAX = расширенное до §64-битного§ входное значение, учитывая знак
	imul	rax, rax, 10
; RAX = RAX*10
	lea	rcx, OFFSET FLAT:month2
; RCX = указатель на таблицу
	add	rcx, rax
; RCX = RCX+RAX = указатель на таблицу+month*10
	mov	rax, rcx
; RAX = §указатель§ §на§ §таблицу§+§месяц§*10
	mov	ecx, 1
; RCX = 1
	imul	rcx, rcx, 0
; RCX = 1*0 = 0
	add	rax, rcx
; RAX = §указатель§ §на§ §таблицу§+§месяц§*10 + 0 = §указатель§ §на§ §таблицу§+§месяц§*10
	ret	0
get_month2 ENDP

