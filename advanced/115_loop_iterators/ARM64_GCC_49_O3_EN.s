; X0=a1
; X1=a2
; X2=cnt
f:
	cbz	x2, .L1            ; cnt==0? exit then
; calculate last element of "a1" array
	add	x2, x2, x2, lsl 1
; X2=X2+X2<<1=X2+X2*2=X2*3
	mov	x3, 0
	lsl	x2, x2, 2
; X2=X2<<2=X2*4=X2*3*4=X2*12
.L3:
	ldr	w4, [x1],28        ; load at X1, add 28 to X1 (post-increment)
	str	w4, [x0,x3]        ; store at X0+X3=a1+X3
	add	x3, x3, 12         ; shift X3
	cmp	x3, x2             ; end?
	bne	.L3
.L1:
	ret
