tv70 = -8	; size = 8
_a$ = 8		; size = 8
_b$ = 16	; size = 8
_f	PROC
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	movsd	xmm0, QWORD PTR _a$[ebp]
	divsd	xmm0, QWORD PTR __real@40091eb851eb851f
	movsd	xmm1, QWORD PTR _b$[ebp]
	mulsd	xmm1, QWORD PTR __real@4010666666666666
	addsd	xmm0, xmm1
	movsd	QWORD PTR tv70[ebp], xmm0
	fld	QWORD PTR tv70[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
_f	ENDP
