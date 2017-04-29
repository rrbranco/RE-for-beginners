a$ = 8
f	PROC
; RCX = input value
	xor	eax, eax
	mov	edx, 1
	lea	r8d, QWORD PTR [rax+32]
; EDX = 1, R8D = 32
	npad	5
$LL4@f:
; pass 1 ------------------------------
	test	rdx, rcx
	je	SHORT $LN3@f
	inc	eax	; rt++
$LN3@f:
	rol	rdx, 1	; RDX=RDX<<1
; -------------------------------------
; pass 2 ------------------------------
	test	rdx, rcx
	je	SHORT $LN11@f
	inc	eax	; rt++
$LN11@f:
	rol	rdx, 1	; RDX=RDX<<1
; -------------------------------------
	dec	r8	; R8--
	jne	SHORT $LL4@f
	fatret	0
f	ENDP
