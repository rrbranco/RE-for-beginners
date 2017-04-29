$SG3143	DB	'm', 00H, 'o', 00H, 'n', 00H, 't', 00H, 'h', 00H, '.', 00H
	DB	'c', 00H, 00H, 00H
$SG3144	DB	'm', 00H, 'o', 00H, 'n', 00H, 't', 00H, 'h', 00H, '<', 00H
	DB	'1', 00H, '2', 00H, 00H, 00H

month$ = 48
get_month1_checked PROC
$LN5:
	push	rbx
	sub	rsp, 32
	movsxd	rbx, ecx
	cmp	ebx, 12
	jl	SHORT $LN3@get_month1
	lea	rdx, OFFSET FLAT:$SG3143
	lea	rcx, OFFSET FLAT:$SG3144
	mov	r8d, 29
	call	_wassert
$LN3@get_month1:
	lea	rcx, OFFSET FLAT:month1
	mov	rax, QWORD PTR [rcx+rbx*8]
	add	rsp, 32
	pop	rbx
	ret	0
get_month1_checked ENDP
