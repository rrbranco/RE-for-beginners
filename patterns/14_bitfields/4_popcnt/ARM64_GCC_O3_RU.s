f:
	mov	w2, 0		; rt=0
	mov	x5, 1
	mov	w1, w2
.L2:
	lsl	x4, x5, x1	; w4 = w5<<w1 = 1<<i
	add	w3, w2, 1	; new_rt=rt+1
	tst	x4, x0		; (1<<i) & a
	add	w1, w1, 1	; i++
; результат TST был ненулевой?
; тогда w2=w3 или rt=new_rt. 
; в противном случае: w2=w2 или rt=rt (§холостая§ §операция§)
	csel	w2, w3, w2, ne
	cmp	w1, 64		; i<64?
	bne	.L2		; да
	mov	w0, w2		; возврат rt
	ret
