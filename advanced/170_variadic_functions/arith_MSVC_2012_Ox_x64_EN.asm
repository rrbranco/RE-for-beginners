$SG3013	DB	'%d', 0aH, 00H

v$ = 8
arith_mean PROC
	mov	DWORD PTR [rsp+8], ecx   ; 1st argument
	mov	QWORD PTR [rsp+16], rdx  ; 2nd argument
	mov	QWORD PTR [rsp+24], r8   ; 3rd argument
	mov	eax, ecx                 ; sum = 1st argument
	lea	rcx, QWORD PTR v$[rsp+8] ; pointer to the 2nd argument
	mov	QWORD PTR [rsp+32], r9   ; 4th argument
	mov	edx, DWORD PTR [rcx]     ; load 2nd argument
	mov	r8d, 1                   ; count=1
	cmp	edx, -1                  ; 2nd argument is -1?
	je	SHORT $LN8@arith_mean    ; exit if so
$LL3@arith_mean:
	add	eax, edx	         ; sum = sum + loaded argument
	mov	edx, DWORD PTR [rcx+8]   ; load next argument
	lea	rcx, QWORD PTR [rcx+8]   ; shift pointer to point to the argument after next
	inc	r8d                      ; count++
	cmp	edx, -1                  ; is loaded argument -1?
	jne	SHORT $LL3@arith_mean    ; go to loop begin if its not
$LN8@arith_mean:
; calculate quotient
	cdq
	idiv	r8d
	ret	0
arith_mean ENDP

main	PROC
	sub	rsp, 56
	mov	edx, 2
	mov	DWORD PTR [rsp+40], -1
	mov	DWORD PTR [rsp+32], 15
	lea	r9d, QWORD PTR [rdx+8]
	lea	r8d, QWORD PTR [rdx+5]
	lea	ecx, QWORD PTR [rdx-1]
	call	arith_mean
	lea	rcx, OFFSET FLAT:$SG3013
	mov	edx, eax
	call	printf
	xor	eax, eax
	add	rsp, 56
	ret	0
main	ENDP
