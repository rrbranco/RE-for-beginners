my_memcpy:
; RDI = destination address
; RSI = source address
; RDX = size of block

; initialize counter (i) at 0
	xor	eax, eax
.L2:
; all bytes copied? exit then:
	cmp	rax, rdx
	je	.L5
; load byte at RSI+i:
	mov	cl, BYTE PTR [rsi+rax]
; store byte at RDI+i:
	mov	BYTE PTR [rdi+rax], cl
	inc	rax ; i++
	jmp	.L2
.L5:
	ret
