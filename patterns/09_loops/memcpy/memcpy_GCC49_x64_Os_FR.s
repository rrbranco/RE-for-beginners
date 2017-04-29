my_memcpy:
; RDI = adresse de destination
; RSI = adresse source
; RDX = taille de bloc

; initialiser le compteur (i) à 0
	xor	eax, eax
.L2:
; tous les octets sont-ils §copiés§? alors sortir:
	cmp	rax, rdx
	je	.L5
; charger l'octet en RSI+i:
	mov	cl, BYTE PTR [rsi+rax]
; stocker l'octet en RDI+i:
	mov	BYTE PTR [rdi+rax], cl
	inc	rax ; i++
	jmp	.L2
.L5:
	ret
