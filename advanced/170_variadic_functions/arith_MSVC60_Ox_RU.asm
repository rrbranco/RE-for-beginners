_v$ = 8
_arith_mean PROC NEAR
	mov	eax, DWORD PTR _v$[esp-4] ; загрузить первый аргумент в sum
	push	esi
	mov	esi, 1		          ; count=1
	lea	edx, DWORD PTR _v$[esp]   ; адрес первого аргумента
$L838:
	mov	ecx, DWORD PTR [edx+4]    ; загрузить следующий аргумент
	add	edx, 4                    ; сдвинуть указатель на следующий аргумент
	cmp	ecx, -1                   ; это -1?
	je	SHORT $L856               ; выйти, если это так
	add	eax, ecx                  ; sum = sum + загруженный аргумент
	inc	esi                       ; count++
	jmp	SHORT $L838
$L856:
; вычислить результат деления

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
