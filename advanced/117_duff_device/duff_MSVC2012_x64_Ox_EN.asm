dst$ = 8
count$ = 16
bzero	PROC
	test	rdx, -8
	je	SHORT $LN11@bzero
; work out 8-byte blocks
	xor	r10d, r10d
	mov	r9, rdx
	shr	r9, 3
	mov	r8d, r10d
	test	r9, r9
	je	SHORT $LN11@bzero
	npad	5
$LL19@bzero:
	inc	r8d
	mov	QWORD PTR [rcx], r10
	add	rcx, 8
	movsxd	rax, r8d
	cmp	rax, r9
	jb	SHORT $LL19@bzero
$LN11@bzero:
; work out the tail
	and	edx, 7
	dec	rdx
	cmp	rdx, 6
	ja	SHORT $LN9@bzero
	lea	r8, OFFSET FLAT:__ImageBase
	mov	eax, DWORD PTR $LN22@bzero[r8+rdx*4]
	add	rax, r8
	jmp	rax
$LN8@bzero:
	mov	BYTE PTR [rcx], 0
	inc	rcx
$LN7@bzero:
	mov	BYTE PTR [rcx], 0
	inc	rcx
$LN6@bzero:
	mov	BYTE PTR [rcx], 0
	inc	rcx
$LN5@bzero:
	mov	BYTE PTR [rcx], 0
	inc	rcx
$LN4@bzero:
	mov	BYTE PTR [rcx], 0
	inc	rcx
$LN3@bzero:
	mov	BYTE PTR [rcx], 0
	inc	rcx
$LN2@bzero:
	mov	BYTE PTR [rcx], 0
$LN9@bzero:
	fatret	0
	npad	1
$LN22@bzero:
	DD	$LN2@bzero
	DD	$LN3@bzero
	DD	$LN4@bzero
	DD	$LN5@bzero
	DD	$LN6@bzero
	DD	$LN7@bzero
	DD	$LN8@bzero
bzero	ENDP
