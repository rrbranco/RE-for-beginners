_v$ = 8
_arith_mean PROC NEAR
	mov	eax, DWORD PTR _v$[esp-4] ; load 1st argument into sum
	push	esi
	mov	esi, 1		          ; count=1
	lea	edx, DWORD PTR _v$[esp]   ; address of the 1st argument
$L838:
	mov	ecx, DWORD PTR [edx+4]    ; load next argument
	add	edx, 4                    ; shift pointer to the next argument
	cmp	ecx, -1                   ; is it -1?
	je	SHORT $L856               ; exit if so
	add	eax, ecx                  ; sum = sum + loaded argument
	inc	esi                       ; count++
	jmp	SHORT $L838
$L856:
; calculate quotient

	cdq
	idiv	esi
	pop	esi
	ret	0
_arith_mean ENDP

$SG851	DB	'%d', 0aH, 00H

_main	PROC NEAR
	push	-1
	push	15
	push	10
	push	7
	push	2
	push	1
	call	_arith_mean
	push	eax
	push	OFFSET FLAT:$SG851 ; '%d'
	call	_printf
	add	esp, 32
	ret	0
_main	ENDP
