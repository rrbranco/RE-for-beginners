$SG4228	DB	'Enter temperature in Fahrenheit:', 0aH, 00H
$SG4230	DB	'%lf', 00H
$SG4231	DB	'Error while parsing your input', 0aH, 00H
$SG4233	DB	'Error: incorrect temperature!', 0aH, 00H
$SG4234	DB	'Celsius: %lf', 0aH, 00H
__real@c071100000000000 DQ 0c071100000000000r	; -273
__real@4040000000000000 DQ 04040000000000000r	; 32
__real@4022000000000000 DQ 04022000000000000r	; 9
__real@4014000000000000 DQ 04014000000000000r	; 5

_fahr$ = -8	; size = 8
_main	PROC
	sub	esp, 8
	push	esi
	mov	esi, DWORD PTR __imp__printf
	push	OFFSET $SG4228		; 'Enter temperature in Fahrenheit:'
	call	esi			; вызвать printf()
	lea	eax, DWORD PTR _fahr$[esp+16]
	push	eax
	push	OFFSET $SG4230		; '%lf'
	call	DWORD PTR __imp__scanf
	add	esp, 12
	cmp	eax, 1
	je	SHORT $LN2@main
	push	OFFSET $SG4231		; 'Error while parsing your input'
	call	esi		; вызвать printf()
	add	esp, 4
	push	0
	call	DWORD PTR __imp__exit
$LN9@main:
$LN2@main:
	movsd	xmm1, QWORD PTR _fahr$[esp+12]
	subsd	xmm1, QWORD PTR __real@4040000000000000 ; 32
	movsd	xmm0, QWORD PTR __real@c071100000000000 ; -273
	mulsd	xmm1, QWORD PTR __real@4014000000000000 ; 5
	divsd	xmm1, QWORD PTR __real@4022000000000000 ; 9
	comisd	xmm0, xmm1
	jbe	SHORT $LN1@main
	push	OFFSET $SG4233		; 'Error: incorrect temperature!'
	call	esi		; вызвать printf()
	add	esp, 4
	push	0
	call	DWORD PTR __imp__exit
$LN10@main:
$LN1@main:
	sub	esp, 8
	movsd	QWORD PTR [esp], xmm1
	push	OFFSET $SG4234		; 'Celsius: %lf'
	call	esi		; вызвать printf()
	add	esp, 12
	; возврат 0 - по стандарту C99
	xor	eax, eax
	pop	esi
	add	esp, 8
	ret	0
$LN8@main:
_main	ENDP
