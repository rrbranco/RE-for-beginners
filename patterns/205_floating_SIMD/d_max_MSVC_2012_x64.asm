a$ = 8
b$ = 16
d_max	PROC
	movsdx	QWORD PTR [rsp+16], xmm1
	movsdx	QWORD PTR [rsp+8], xmm0
	movsdx	xmm0, QWORD PTR a$[rsp]
	comisd	xmm0, QWORD PTR b$[rsp]
	jbe	SHORT $LN1@d_max
	movsdx	xmm0, QWORD PTR a$[rsp]
	jmp	SHORT $LN2@d_max
$LN1@d_max:
	movsdx	xmm0, QWORD PTR b$[rsp]
$LN2@d_max:
	fatret	0
d_max	ENDP
