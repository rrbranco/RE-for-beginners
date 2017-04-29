my_max:
; RDI=A
; RSI=B
; сравнить A и B:
	cmp	rdi, rsi
; подготовить B в RAX для возврата:
	mov	rax, rsi
; если A>=B, оставить A (RDI) в RAX для возврата.
; в противном случае, инструкция ничего не делает §(если A<B)§
	cmovge	rax, rdi
	ret

my_min:
; RDI=A
; RSI=B
; сравнить A и B:
	cmp	rdi, rsi
; подготовить B в RAX для возврата:
	mov	rax, rsi
; если A<=B, оставить A (RDI) в RAX для возврата.
; в противном случае, инструкция ничего не делает §(если A>B)§
	cmovle	rax, rdi
	ret
