__real@4010666666666666 DQ 04010666666666666r	; 4.1
__real@40091eb851eb851f DQ 040091eb851eb851fr	; 3.14

a$ = 8
b$ = 16
f	PROC
	movsdx	QWORD PTR [rsp+16], xmm1
	movsdx	QWORD PTR [rsp+8], xmm0
	movsdx	xmm0, QWORD PTR a$[rsp]
	divsd	xmm0, QWORD PTR __real@40091eb851eb851f
	movsdx	xmm1, QWORD PTR b$[rsp]
	mulsd	xmm1, QWORD PTR __real@4010666666666666
	addsd	xmm0, xmm1
	ret	0
f	ENDP
