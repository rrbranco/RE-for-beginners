$SG4228	DB	'Enter temperature in Fahrenheit:', 0aH, 00H
$SG4230	DB	'%d', 00H
$SG4231	DB	'Error while parsing your input', 0aH, 00H
$SG4233	DB	'Error: incorrect temperature!', 0aH, 00H
$SG4234	DB	'Celsius: %d', 0aH, 00H

_fahr$ = -4	; size = 4
_main	PROC
	push	ecx
	push	esi
	mov	esi, DWORD PTR __imp__printf
	push	OFFSET $SG4228		; 'Enter temperature in Fahrenheit:'
	call	esi			; call printf()
	lea	eax, DWORD PTR _fahr$[esp+12]
	push	eax
	push	OFFSET $SG4230		; '%d'
	call	DWORD PTR __imp__scanf
	add	esp, 12
	cmp	eax, 1
	je	SHORT $LN2@main
	push	OFFSET $SG4231		; 'Error while parsing your input'
	call	esi			; call printf()
	add	esp, 4
	push	0
	call	DWORD PTR __imp__exit
$LN9@main:
$LN2@main:
	mov	eax, DWORD PTR _fahr$[esp+8]
	add	eax, -32	; ffffffe0H
	lea	ecx, DWORD PTR [eax+eax*4]
	mov	eax, 954437177	; 38e38e39H
	imul	ecx
	sar	edx, 1
	mov	eax, edx
	shr	eax, 31		; 0000001fH
	add	eax, edx
	cmp	eax, -273	; fffffeefH
	jge	SHORT $LN1@main
	push	OFFSET $SG4233		; 'Error: incorrect temperature!'
	call	esi	; call printf()
	add	esp, 4
	push	0
	call	DWORD PTR __imp__exit
$LN10@main:
$LN1@main:
	push	eax
	push	OFFSET $SG4234		; 'Celsius: %d'
	call	esi	; call printf()
	add	esp, 8
	; return 0 - by C99 standard
	xor	eax, eax
	pop	esi
	pop	ecx
	ret	0
$LN8@main:
_main	ENDP
