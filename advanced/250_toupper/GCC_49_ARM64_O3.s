toupper:
	uxtb	w0, w0
	sub	w1, w0, #97
	uxtb	w1, w1
	cmp	w1, 25
	bhi	.L2
	sub	w0, w0, #32
	uxtb	w0, w0
.L2:
	ret
