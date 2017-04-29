my_memcpy:
; RDI = Zieladresse
; RSI = Quelladresse
; RDX = Blockgröße

; §initialisiere Zähler (i) mit 0§
	xor	eax, eax
.L2:
; alles kopiert? dann verlassen:
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
