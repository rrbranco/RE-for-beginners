a$ = 8
b$ = 16
d_max	PROC
	comisd	xmm0, xmm1
	ja	SHORT $LN2@d_max
	movaps	xmm0, xmm1
$LN2@d_max:
	fatret	0
d_max	ENDP
