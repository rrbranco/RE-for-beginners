s$ = 8
str_trim PROC

; RCX это первый аргумент функции, и он всегда будет указывать на строку
	mov	rdx, rcx
; это функция strlen() встроенная в код прямо здесь:
; установить RAX в 0xFFFFFFFFFFFFFFFF (-1)
	or	rax, -1
$LL14@str_trim:
	inc	rax
	cmp	BYTE PTR [rcx+rax], 0
	jne	SHORT $LL14@str_trim
; длина входной строки 0? тогда на выход:
	test	rax, rax
	je	SHORT $LN15@str_trim
; RAX содержит длину строки
	dec	rcx
; RCX = s-1
	mov	r8d, 1
	add	rcx, rax
; RCX = s-1+strlen(s), §т.е.,§ это адрес последнего символа в строке
	sub	r8, rdx
; R8 = 1-s
$LL6@str_trim:
; загрузить последний символ строки:
; перейти, если его код 13 или 10:
	movzx	eax, BYTE PTR [rcx]
	cmp	al, 13
	je	SHORT $LN2@str_trim
	cmp	al, 10
	jne	SHORT $LN15@str_trim
$LN2@str_trim:
; последний символ имеет код 13 или 10
; записываем ноль в этом месте:
	mov	BYTE PTR [rcx], 0
; декремент адреса последнего символа,
; так что он будет указывать на символ перед только что стертым:
	dec	rcx
	lea	rax, QWORD PTR [r8+rcx]
; RAX = 1 - s + адрес текущего последнего символа
; так мы определяем, достигли ли мы первого символа, и раз так, то нам нужно остановиться
	test	rax, rax
	jne	SHORT $LL6@str_trim
$LN15@str_trim:
	mov	rax, rdx
	ret	0
str_trim ENDP
