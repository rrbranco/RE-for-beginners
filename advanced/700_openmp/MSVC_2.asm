	push	edi
	push	OFFSET _checked
	call	__vcomp_atomic_add_i4
; Line 55
	push	OFFSET _$vcomp$critsect$
	call	__vcomp_enter_critsect
	add	esp, 12
; Line 56
	mov	ecx, DWORD PTR _checked
	mov	eax, ecx
	cdq
	mov	esi, 100000	; 000186a0H
	idiv	esi
	test	edx, edx
	jne	SHORT $LN1@check_nonc
; Line 57
	push	ecx
	push	OFFSET ??_C@_0M@NPNHLIOO@checked?$DN?$CFd?6?$AA@
	call	_printf
	pop	ecx
	pop	ecx
$LN1@check_nonc:
	push	DWORD PTR _$vcomp$critsect$
	call	__vcomp_leave_critsect
	pop	ecx
