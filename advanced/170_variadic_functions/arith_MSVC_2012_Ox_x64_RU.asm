$SG3013	DB	'%d', 0aH, 00H

v$ = 8
arith_mean PROC
	mov	DWORD PTR [rsp+8], ecx   ; первый аргумент
	mov	QWORD PTR [rsp+16], rdx  ; второй аргумент
	mov	QWORD PTR [rsp+24], r8   ; третий аргумент
	mov	eax, ecx                 ; sum = первый аргумент
	lea	rcx, QWORD PTR v$[rsp+8] ; указатель на второй аргумент
	mov	QWORD PTR [rsp+32], r9   ; §4-й аргумент§
	mov	edx, DWORD PTR [rcx]     ; загрузить второй аргумент
	mov	r8d, 1                   ; count=1
	cmp	edx, -1                  ; второй аргумент равен -1?
	je	SHORT $LN8@arith_mean    ; если так, то выход
$LL3@arith_mean:
	add	eax, edx	         ; sum = sum + загруженный аргумент
	mov	edx, DWORD PTR [rcx+8]   ; загрузить следующий аргумент
	lea	rcx, QWORD PTR [rcx+8]   ; сдвинуть указатель, чтобы он указывал на аргумент за следующим
	inc	r8d                      ; count++
	cmp	edx, -1                  ; загруженный аргумент равен -1?
	jne	SHORT $LL3@arith_mean    ; перейти на начал цикла, если нет
$LN8@arith_mean:
; вычислить результат деления
	cdq
	idiv	r8d
	ret	0
arith_mean ENDP

main	PROC
	sub	rsp, 56
	mov	edx, 2
	mov	DWORD PTR [rsp+40], -1
	mov	DWORD PTR [rsp+32], 15
	lea	r9d, QWORD PTR [rdx+8]
	lea	r8d, QWORD PTR [rdx+5]
	lea	ecx, QWORD PTR [rdx-1]
	call	arith_mean
	lea	rcx, OFFSET FLAT:$SG3013
	mov	edx, eax
	call	printf
	xor	eax, eax
	add	rsp, 56
	ret	0
main	ENDP
