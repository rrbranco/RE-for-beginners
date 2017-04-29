my_memcpy:
; X0 = adresse de destination
; X1 = adresse source
; X2 = taille de bloc

; initialiser le compteur (i) §à§ 0
	mov	x3, 0
.L2:
; tous les octets sont-ils §copiés§? alors sortir:
	cmp	x3, x2
	beq	.L5
; charger l'octet en X1+i:
	ldrb	w4, [x1,x3]
; stocker l'octet en X0+i:
	strb	w4, [x0,x3]
	add	x3, x3, 1 ; i++
	b	.L2
.L5:
	ret
