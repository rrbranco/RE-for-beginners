str_trim:
	push	rbx
	mov	rbx, rdi
; RBX всегда будет "s"
	call	strlen
; проверить на str_len==0 и выйти, если это так
	test	rax, rax
	je	.L9
	lea	rdx, [rax-1]
; RDX всегда будет содержать значение str_len-1, но не str_len
; так что RDX будет скорее индексом буфера
	lea	rsi, [rbx+rdx]      ; RSI=s+str_len-1
	movzx	ecx, BYTE PTR [rsi] ; загрузить символ
	test	cl, cl
	je	.L9                 ; выйти, если это ноль
	cmp	cl, 10
	je	.L4
	cmp	cl, 13              ; выйти, если это не '\n' и не '\r'
	jne	.L9
.L4:
; это странная инструкция. нам здесь нужно RSI=s-1
; это можно сделать, используя MOV RSI, EBX / DEC RSI
; но это две инструкции между одной
	sub	rsi, rax
; RSI = s+str_len-1-str_len = s-1
; начало главного цикла
.L12:
	test	rdx, rdx
; записать ноль по адресу s-1+str_len-1+1 = s-1+str_len = s+str_len-1
	mov	BYTE PTR [rsi+1+rdx], 0  
; проверка на str_len-1==0. выход, если да.
	je	.L9
	sub	rdx, 1                   ; эквивалент str_len--
; загрузить следующий символ по адресу s+str_len-1
	movzx	ecx, BYTE PTR [rbx+rdx]  
	test	cl, cl                   ; это ноль? тогда выход
	je	.L9
	cmp	cl, 10                   ; это '\n'?
	je	.L12
	cmp	cl, 13                   ; это '\r'?
	je	.L12
.L9:
; возврат "s"
	mov	rax, rbx
	pop	rbx
	ret
