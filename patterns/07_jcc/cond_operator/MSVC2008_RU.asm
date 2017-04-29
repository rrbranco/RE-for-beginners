$SG746	DB	'it is ten', 00H
$SG747	DB	'it is not ten', 00H

tv65 = -4 ; будет использовано как временная переменная
_a$ = 8	
_f	PROC
	push	ebp
	mov	ebp, esp
	push	ecx
; сравнить входное значение с 10
	cmp	DWORD PTR _a$[ebp], 10
; переход на $LN3@f если не равно
	jne	SHORT $LN3@f
; сохранить указатель на строку во временной переменной:
	mov	DWORD PTR tv65[ebp], OFFSET $SG746 ; 'it is ten'
; перейти на выход
	jmp	SHORT $LN4@f
$LN3@f:
; сохранить указатель на строку во временной переменной:
	mov	DWORD PTR tv65[ebp], OFFSET $SG747 ; 'it is not ten'
$LN4@f:
; это выход. скопировать указатель на строку из временной переменной в EAX.
	mov	eax, DWORD PTR tv65[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
_f	ENDP
