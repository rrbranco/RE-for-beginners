$SG3454	DB	'true', 00H
$SG3456	DB	'false', 00H

_s$ = 8		; size = 4
?is_bool@@YA_NPAD@Z PROC ; is_bool
	push	esi
	mov	esi, DWORD PTR _s$[esp]
	mov	ecx, OFFSET $SG3454 ; 'true'
	mov	eax, esi
	npad	4 ; выровнять следующую метку
$LL6@is_bool:
	mov	dl, BYTE PTR [eax]
	cmp	dl, BYTE PTR [ecx]
	jne	SHORT $LN7@is_bool
	test	dl, dl
	je	SHORT $LN8@is_bool
	mov	dl, BYTE PTR [eax+1]
	cmp	dl, BYTE PTR [ecx+1]
	jne	SHORT $LN7@is_bool
	add	eax, 2
	add	ecx, 2
	test	dl, dl
	jne	SHORT $LL6@is_bool
$LN8@is_bool:
	xor	eax, eax
	jmp	SHORT $LN9@is_bool
$LN7@is_bool:
	sbb	eax, eax
	sbb	eax, -1
$LN9@is_bool:
	test	eax, eax
	jne	SHORT $LN2@is_bool

	mov	al, 1
	pop	esi

	ret	0
$LN2@is_bool:

	mov	ecx, OFFSET $SG3456 ; 'false'
	mov	eax, esi
$LL10@is_bool:
	mov	dl, BYTE PTR [eax]
	cmp	dl, BYTE PTR [ecx]
	jne	SHORT $LN11@is_bool
	test	dl, dl
	je	SHORT $LN12@is_bool
	mov	dl, BYTE PTR [eax+1]
	cmp	dl, BYTE PTR [ecx+1]
	jne	SHORT $LN11@is_bool
	add	eax, 2
	add	ecx, 2
	test	dl, dl
	jne	SHORT $LL10@is_bool
$LN12@is_bool:
	xor	eax, eax
	jmp	SHORT $LN13@is_bool
$LN11@is_bool:
	sbb	eax, eax
	sbb	eax, -1
$LN13@is_bool:
	test	eax, eax
	jne	SHORT $LN1@is_bool

	xor	al, al
	pop	esi

	ret	0
$LN1@is_bool:

	push	11
	push	OFFSET $SG3458
	push	OFFSET $SG3459
	call	DWORD PTR __imp___wassert
	add	esp, 12
	pop	esi

	ret	0
?is_bool@@YA_NPAD@Z ENDP ; is_bool
