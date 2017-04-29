_a$ = 8		; size = 8
_b$ = 16	; size = 8
_d_max	PROC
	movsd	xmm0, QWORD PTR _a$[esp-4]
	comisd	xmm0, QWORD PTR _b$[esp-4]
	jbe	SHORT $LN1@d_max
	fld	QWORD PTR _a$[esp-4]
	ret	0
$LN1@d_max:
	fld	QWORD PTR _b$[esp-4]
	ret	0
_d_max	ENDP
