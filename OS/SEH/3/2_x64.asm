$SG86276 DB	'hello #1!', 0aH, 00H
$SG86277 DB	'hello #2!', 0aH, 00H
$SG86279 DB	'access violation, can''t recover', 0aH, 00H

pdata	SEGMENT
$pdata$main DD	imagerel $LN9
	DD	imagerel $LN9+61
	DD	imagerel $unwind$main
pdata	ENDS
pdata	SEGMENT
$pdata$main$filt$0 DD imagerel main$filt$0
	DD	imagerel main$filt$0+32
	DD	imagerel $unwind$main$filt$0
pdata	ENDS
xdata	SEGMENT
$unwind$main DD	020609H
	DD	030023206H
	DD	imagerel __C_specific_handler
	DD	01H
	DD	imagerel $LN9+8
	DD	imagerel $LN9+40
	DD	imagerel main$filt$0
	DD	imagerel $LN9+40
$unwind$main$filt$0 DD 020601H
	DD	050023206H
xdata	ENDS

_TEXT	SEGMENT
main	PROC
$LN9:
	push	rbx
	sub	rsp, 32
	xor	ebx, ebx
	lea	rcx, OFFSET FLAT:$SG86276 ; 'hello #1!'
	call	printf
	mov	DWORD PTR [rbx], 13
	lea	rcx, OFFSET FLAT:$SG86277 ; 'hello #2!'
	call	printf
	jmp	SHORT $LN8@main
$LN6@main:
	lea	rcx, OFFSET FLAT:$SG86279 ; 'access violation, can''t recover'
	call	printf
	npad	1 ; align next label
$LN8@main:
	xor	eax, eax
	add	rsp, 32
	pop	rbx
	ret	0
main	ENDP
_TEXT	ENDS

text$x	SEGMENT
main$filt$0 PROC
	push	rbp
	sub	rsp, 32
	mov	rbp, rdx
$LN5@main$filt$:
	mov	rax, QWORD PTR [rcx]
	xor	ecx, ecx
	cmp	DWORD PTR [rax], -1073741819; c0000005H
	sete	cl
	mov	eax, ecx
$LN7@main$filt$:
	add	rsp, 32
	pop	rbp
	ret	0
	int	3
main$filt$0 ENDP
text$x	ENDS
