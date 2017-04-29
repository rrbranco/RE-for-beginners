$T1 = -8	; size = 4
$T2 = -4	; size = 4
_main$omp$1 PROC
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ecx
	push	esi
	lea	eax, DWORD PTR $T2[ebp]
	push	eax
	lea	eax, DWORD PTR $T1[ebp]
	push	eax
	push	1
	push	1
	push	2147483646	; 7ffffffeH
	push	0
	call	__vcomp_for_static_simple_init
	mov	esi, DWORD PTR $T1[ebp]
	add	esp, 24
	jmp	SHORT $LN6@main$omp$1
$LL2@main$omp$1:
	push	esi
	call	_check_nonce
	pop	ecx
	inc	esi
$LN6@main$omp$1:
	cmp	esi, DWORD PTR $T2[ebp]
	jle	SHORT $LL2@main$omp$1
	call	__vcomp_for_static_end
	pop	esi
	leave
	ret	0
_main$omp$1 ENDP
