$SG86277 DB	'in filter. code=0x%08X', 0aH, 00H
$SG86279 DB	'yes, that is our exception', 0aH, 00H
$SG86281 DB	'not our exception', 0aH, 00H
$SG86288 DB	'hello!', 0aH, 00H
$SG86290 DB	'0x112233 raised. now let''s crash', 0aH, 00H
$SG86292 DB	'access violation, can''t recover', 0aH, 00H
$SG86294 DB	'user exception caught', 0aH, 00H

pdata	SEGMENT
$pdata$filter_user_exceptions DD imagerel $LN6
	DD	imagerel $LN6+73
	DD	imagerel $unwind$filter_user_exceptions
$pdata$main DD	imagerel $LN14
	DD	imagerel $LN14+95
	DD	imagerel $unwind$main
pdata	ENDS
pdata	SEGMENT
$pdata$main$filt$0 DD imagerel main$filt$0
	DD	imagerel main$filt$0+32
	DD	imagerel $unwind$main$filt$0
$pdata$main$filt$1 DD imagerel main$filt$1
	DD	imagerel main$filt$1+30
	DD	imagerel $unwind$main$filt$1
pdata	ENDS

xdata	SEGMENT
$unwind$filter_user_exceptions DD 020601H
	DD	030023206H
$unwind$main DD	020609H
	DD	030023206H
	DD	imagerel __C_specific_handler
	DD	02H
	DD	imagerel $LN14+8
	DD	imagerel $LN14+59
	DD	imagerel main$filt$0
	DD	imagerel $LN14+59
	DD	imagerel $LN14+8
	DD	imagerel $LN14+74
	DD	imagerel main$filt$1
	DD	imagerel $LN14+74
$unwind$main$filt$0 DD 020601H
	DD	050023206H
$unwind$main$filt$1 DD 020601H
	DD	050023206H
xdata	ENDS

_TEXT	SEGMENT
main	PROC
$LN14:
	push	rbx
	sub	rsp, 32
	xor	ebx, ebx
	lea	rcx, OFFSET FLAT:$SG86288 ; 'hello!'
	call	printf
	xor	r9d, r9d
	xor	r8d, r8d
	xor	edx, edx
	mov	ecx, 1122867 ; 00112233H
	call	QWORD PTR __imp_RaiseException
	lea	rcx, OFFSET FLAT:$SG86290 ; '0x112233 raised. now let''s crash'
	call	printf
	mov	DWORD PTR [rbx], 13
	jmp	SHORT $LN13@main
$LN11@main:
	lea	rcx, OFFSET FLAT:$SG86292 ; 'access violation, can''t recover'
	call	printf
	npad	1 ; align next label
$LN13@main:
	jmp	SHORT $LN9@main
$LN7@main:
	lea	rcx, OFFSET FLAT:$SG86294 ; 'user exception caught'
	call	printf
	npad	1 ; align next label
$LN9@main:
	xor	eax, eax
	add	rsp, 32
	pop	rbx
	ret	0
main	ENDP

text$x	SEGMENT
main$filt$0 PROC
	push	rbp
	sub	rsp, 32
	mov	rbp, rdx
$LN10@main$filt$:
	mov	rax, QWORD PTR [rcx]
	xor	ecx, ecx
	cmp	DWORD PTR [rax], -1073741819; c0000005H
	sete	cl
	mov	eax, ecx
$LN12@main$filt$:
	add	rsp, 32
	pop	rbp
	ret	0
	int	3
main$filt$0 ENDP

main$filt$1 PROC
	push	rbp
	sub	rsp, 32
	mov	rbp, rdx
$LN6@main$filt$:
	mov	rax, QWORD PTR [rcx]
	mov	rdx, rcx
	mov	ecx, DWORD PTR [rax]
	call	filter_user_exceptions
	npad	1 ; align next label
$LN8@main$filt$:
	add	rsp, 32
	pop	rbp
	ret	0
	int	3
main$filt$1 ENDP
text$x	ENDS

_TEXT	SEGMENT
code$ = 48
ep$ = 56
filter_user_exceptions PROC
$LN6:
	push	rbx
	sub	rsp, 32
	mov	ebx, ecx
	mov	edx, ecx
	lea	rcx, OFFSET FLAT:$SG86277 ; 'in filter. code=0x%08X'
	call	printf
	cmp	ebx, 1122867; 00112233H
	jne	SHORT $LN2@filter_use
	lea	rcx, OFFSET FLAT:$SG86279 ; 'yes, that is our exception'
	call	printf
	mov	eax, 1
	add	rsp, 32
	pop	rbx
	ret	0
$LN2@filter_use:
	lea	rcx, OFFSET FLAT:$SG86281 ; 'not our exception'
	call	printf
	xor	eax, eax
	add	rsp, 32
	pop	rbx
	ret	0
filter_user_exceptions ENDP
_TEXT	ENDS
