$SG2994	DB	'%d', 0aH, 00H

a$ = 48
f	PROC
	mov	DWORD PTR [rsp+8], ecx   ; save input value in Shadow Space
	sub	rsp, 40
	lea	rcx, QWORD PTR a$[rsp]   ; get address of value and pass it to modify_a()
	call	modify_a
	mov	edx, DWORD PTR a$[rsp]   ; reload value from Shadow Space and pass it to printf()
	lea	rcx, OFFSET FLAT:$SG2994 ; '%d'
	call	printf
	add	rsp, 40
	ret	0
f	ENDP
