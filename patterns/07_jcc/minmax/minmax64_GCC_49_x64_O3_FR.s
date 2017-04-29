my_max:
; RDI=A
; RSI=B
; comparer A et B:
	cmp	rdi, rsi
; §préparer B pour le renvoyer dans RAX:§
	mov	rax, rsi
; si A>=B, mettre A (RDI) dans RAX pour le renvoyer.
; cette instruction ne fait rien autrement (si A<B)
	cmovge	rax, rdi
	ret

my_min:
; RDI=A
; RSI=B
; comparer A et B:
	cmp	rdi, rsi
; §préparer B pour le renvoyer dans RAX:§
	mov	rax, rsi
; si A<=B, mettre A (RDI) dans RAX pour le renvoyer.
; cette instruction ne fait rien autrement (si A>B)
	cmovle	rax, rdi
	ret
