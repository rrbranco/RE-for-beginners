$SG4038	DB	'Enter temperature in Fahrenheit:', 0aH, 00H
$SG4040	DB	'%lf', 00H
$SG4041	DB	'Error while parsing your input', 0aH, 00H
$SG4043	DB	'Error: incorrect temperature!', 0aH, 00H
$SG4044	DB	'Celsius: %lf', 0aH, 00H

__real@c071100000000000 DQ 0c071100000000000r	; -273
__real@4022000000000000 DQ 04022000000000000r	; 9
__real@4014000000000000 DQ 04014000000000000r	; 5
__real@4040000000000000 DQ 04040000000000000r	; 32

_fahr$ = -8	; size = 8
_main	PROC
	sub	esp, 8
	push	esi
	mov	esi, DWORD PTR __imp__printf
	push	OFFSET $SG4038		; 'Enter temperature in Fahrenheit:'
	call	esi			; вызвать printf()
	lea	eax, DWORD PTR _fahr$[esp+16]
	push	eax
	push	OFFSET $SG4040		; '%lf'
	call	DWORD PTR __imp__scanf
	add	esp, 12	
	cmp	eax, 1
	je	SHORT $LN2@main
	push	OFFSET $SG4041		; 'Error while parsing your input'
	call	esi		; вызвать printf()
	add	esp, 4
	push	0
	call	DWORD PTR __imp__exit
$LN2@main:
	fld	QWORD PTR _fahr$[esp+12]
	fsub	QWORD PTR __real@4040000000000000 ; 32
	fmul	QWORD PTR __real@4014000000000000 ; 5
	fdiv	QWORD PTR __real@4022000000000000 ; 9
	fld	QWORD PTR __real@c071100000000000 ; -273
	fcomp	ST(1)
	fnstsw	ax
	test	ah, 65		; 00000041H
	jne	SHORT $LN1@main
	push	OFFSET $SG4043		; 'Error: incorrect temperature!'
	fstp	ST(0)
	call	esi			; вызвать printf()
	add	esp, 4
	push	0
	call	DWORD PTR __imp__exit
$LN1@main:
	sub	esp, 8
	fstp	QWORD PTR [esp]
	push	OFFSET $SG4044		; 'Celsius: %lf'
	call	esi
	add	esp, 12
	; возврат 0 - по стандарту C99
	xor	eax, eax
	pop	esi
	add	esp, 8
	ret	0
$LN10@main:
_main	ENDP
