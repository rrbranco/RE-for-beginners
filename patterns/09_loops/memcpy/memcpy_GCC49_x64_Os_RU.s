my_memcpy:
; RDI = целевой адрес
; RSI = исходный адрес
; RDX = размер блока

; инициализировать счетчик (i) в 0
	xor	eax, eax
.L2:
; все байты скопированы? тогда заканчиваем:
	cmp	rax, rdx
	je	.L5
; загружаем байт по адресу RSI+i:
	mov	cl, BYTE PTR [rsi+rax]
; записываем байт по адресу RDI+i:
	mov	BYTE PTR [rdi+rax], cl
	inc	rax ; i++
	jmp	.L2
.L5:
	ret
