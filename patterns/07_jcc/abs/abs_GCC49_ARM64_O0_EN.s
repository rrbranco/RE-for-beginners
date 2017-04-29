my_abs:
	sub	sp, sp, #16
	str	w0, [sp,12]
	ldr	w0, [sp,12]
; compare input value with contents of WZR register
; (which always holds zero)
	cmp	w0, wzr
	bge	.L2
	ldr	w0, [sp,12]
	neg	w0, w0
	b	.L3
.L2:
	ldr	w0, [sp,12]
.L3:
	add	sp, sp, 16
	ret
