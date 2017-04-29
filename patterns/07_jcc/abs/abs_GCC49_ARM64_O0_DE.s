my_abs:
	sub	sp, sp, #16
	str	w0, [sp,12]
	ldr	w0, [sp,12]
; vergleiche Eingabewert mit dem Inhalt des WZR Registers
; §(welches immer 0 enthält)§
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
