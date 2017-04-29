$SG2777	DB	'%d %d %d %d %d %d %d', 0aH, 00H

a$ = 80
b$ = 88
c$ = 96
d$ = 104
e$ = 112
f$ = 120
g$ = 128
f1	PROC
$LN3:
	sub	rsp, 72

	mov	eax, DWORD PTR g$[rsp]
	mov	DWORD PTR [rsp+56], eax
	mov	eax, DWORD PTR f$[rsp]
	mov	DWORD PTR [rsp+48], eax
	mov	eax, DWORD PTR e$[rsp]
	mov	DWORD PTR [rsp+40], eax
	mov	DWORD PTR [rsp+32], r9d
	mov	r9d, r8d
	mov	r8d, edx
	mov	edx, ecx
	lea	rcx, OFFSET FLAT:$SG2777
	call	printf

	add	rsp, 72
	ret	0
f1	ENDP

main	PROC
	sub	rsp, 72

	mov	edx, 2
	mov	DWORD PTR [rsp+48], 7
	mov	DWORD PTR [rsp+40], 6
	lea	r9d, QWORD PTR [rdx+2]
	lea	r8d, QWORD PTR [rdx+1]
	lea	ecx, QWORD PTR [rdx-1]
	mov	DWORD PTR [rsp+32], 5
	call	f1

	xor	eax, eax
	add	rsp, 72
	ret	0
main	ENDP
