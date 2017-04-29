$SG2937	DB	'%d %d %d %d %d %d %d', 0aH, 00H

main	PROC
	sub	rsp, 72

	mov	DWORD PTR [rsp+48], 7
	mov	DWORD PTR [rsp+40], 6
	mov	DWORD PTR [rsp+32], 5
	mov	r9d, 4
	mov	r8d, 3
	mov	edx, 2
	mov	ecx, 1
	call	f1

	xor	eax, eax
	add	rsp, 72
	ret	0
main	ENDP

a$ = 80
b$ = 88
c$ = 96
d$ = 104
e$ = 112
f$ = 120
g$ = 128
f1	PROC
$LN3:
	mov	DWORD PTR [rsp+32], r9d
	mov	DWORD PTR [rsp+24], r8d
	mov	DWORD PTR [rsp+16], edx
	mov	DWORD PTR [rsp+8], ecx
	sub	rsp, 72

	mov	eax, DWORD PTR g$[rsp]
	mov	DWORD PTR [rsp+56], eax
	mov	eax, DWORD PTR f$[rsp]
	mov	DWORD PTR [rsp+48], eax
	mov	eax, DWORD PTR e$[rsp]
	mov	DWORD PTR [rsp+40], eax
	mov	eax, DWORD PTR d$[rsp]
	mov	DWORD PTR [rsp+32], eax
	mov	r9d, DWORD PTR c$[rsp]
	mov	r8d, DWORD PTR b$[rsp]
	mov	edx, DWORD PTR a$[rsp]
	lea	rcx, OFFSET FLAT:$SG2937
	call	printf

	add	rsp, 72
	ret	0
f1	ENDP
