tv67 = 8	; size = 8
_a$ = 8		; size = 8
_b$ = 16	; size = 8
_f	PROC
	movsd	xmm1, QWORD PTR _a$[esp-4]
	divsd	xmm1, QWORD PTR __real@40091eb851eb851f
	movsd	xmm0, QWORD PTR _b$[esp-4]
	mulsd	xmm0, QWORD PTR __real@4010666666666666
	addsd	xmm1, xmm0
	movsd	QWORD PTR tv67[esp-4], xmm1
	fld	QWORD PTR tv67[esp-4]
	ret	0
_f	ENDP
