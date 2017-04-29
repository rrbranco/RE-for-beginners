_input$ = 8		; size = 4
_bit$ = 12		; size = 4
_set_bit PROC
	mov	ecx, DWORD PTR _bit$[esp-4]
	mov	eax, 1
	shl	eax, cl
	or	eax, DWORD PTR _input$[esp-4]
	ret	0
_set_bit ENDP

_netmask_bits$ = 8	; size = 1
_form_netmask PROC
	push	ebx
	push	esi
	movzx	esi, BYTE PTR _netmask_bits$[esp+4]
	xor	ecx, ecx
	xor	bl, bl
	test	esi, esi
	jle	SHORT $LN9@form_netma
	xor	edx, edx
$LL3@form_netma:
	mov	eax, 31
	sub	eax, edx
	push	eax
	push	ecx
	call	_set_bit
	inc	bl
	movzx	edx, bl
	add	esp, 8
	mov	ecx, eax
	cmp	edx, esi
	jl	SHORT $LL3@form_netma
$LN9@form_netma:
	pop	esi
	mov	eax, ecx
	pop	ebx
	ret	0
_form_netmask ENDP
