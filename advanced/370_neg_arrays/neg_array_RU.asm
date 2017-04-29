$SG2751	DB	'first element %d', 0aH, 00H
$SG2752	DB	'second element %d', 0aH, 00H
$SG2753	DB	'last element %d', 0aH, 00H
$SG2754	DB	'array[-1]=%02X, array[-2]=%02X, array[-3]=%02X, array[-4'
	DB	']=%02X', 0aH, 00H

_fakearray$ = -24		; size = 4
_random_value$ = -20	; size = 4
_array$ = -16		; size = 10
_i$ = -4		; size = 4
_main	PROC
	push	ebp
	mov	ebp, esp
	sub	esp, 24
	mov	DWORD PTR _random_value$[ebp], 287454020 ; 11223344H
	; установить fakearray[] на байт раньше перед array[]
	lea	eax, DWORD PTR _array$[ebp]
	add	eax, -1 ; eax=eax-1
	mov	DWORD PTR _fakearray$[ebp], eax
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $LN3@main
	; заполнить array[] 0..9
$LN2@main:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$LN3@main:
	cmp	DWORD PTR _i$[ebp], 10
	jge	SHORT $LN1@main
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR _i$[ebp]
	mov	BYTE PTR _array$[ebp+edx], al
	jmp	SHORT $LN2@main
$LN1@main:
	mov	ecx, DWORD PTR _fakearray$[ebp]
	; ecx=§адрес§ fakearray[0], ecx+1 это fakearray[1] либо array[0]
	movzx	edx, BYTE PTR [ecx+1]
	push	edx
	push	OFFSET $SG2751 ; 'first element %d'
	call	_printf
	add	esp, 8
	mov	eax, DWORD PTR _fakearray$[ebp]
	; eax=§адрес§ fakearray[0], eax+2 это fakearray[2] либо array[1]
	movzx	ecx, BYTE PTR [eax+2]
	push	ecx
	push	OFFSET $SG2752 ; 'second element %d'
	call	_printf
	add	esp, 8
	mov	edx, DWORD PTR _fakearray$[ebp]
	; edx=§адрес§ fakearray[0], edx+10 это fakearray[10] либо array[9]
	movzx	eax, BYTE PTR [edx+10]
	push	eax
	push	OFFSET $SG2753 ; 'last element %d'
	call	_printf
	add	esp, 8
	; отнять 4, 3, 2 и 1 от указателя array[0] чтобы найти значения, лежащие перед array[]
	lea	ecx, DWORD PTR _array$[ebp]
	movzx	edx, BYTE PTR [ecx-4]
	push	edx
	lea	eax, DWORD PTR _array$[ebp]
	movzx	ecx, BYTE PTR [eax-3]
	push	ecx
	lea	edx, DWORD PTR _array$[ebp]
	movzx	eax, BYTE PTR [edx-2]
	push	eax
	lea	ecx, DWORD PTR _array$[ebp]
	movzx	edx, BYTE PTR [ecx-1]
	push	edx
	push	OFFSET $SG2754 ; 'array[-1]=%02X, array[-2]=%02X, array[-3]=%02X, array[-4]=%02X'
	call	_printf
	add	esp, 20
	xor	eax, eax
	mov	esp, ebp
	pop	ebp
	ret	0
_main	ENDP
