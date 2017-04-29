toupper:
	sub	sp, sp, #16
	strb	w0, [sp,15]
	ldrb	w0, [sp,15]
	cmp	w0, 96
	bls	.L2
	ldrb	w0, [sp,15]
	cmp	w0, 122
	bhi	.L2
	ldrb	w0, [sp,15]
	sub	w0, w0, #32
	uxtb	w0, w0
	b	.L3
.L2:
	ldrb	w0, [sp,15]
.L3:
	add	sp, sp, 16
	ret
