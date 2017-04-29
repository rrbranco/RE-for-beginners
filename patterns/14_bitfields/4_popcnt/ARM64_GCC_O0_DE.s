f:
	sub	sp, sp, #32
	str	x0, [sp,8]	; speichere "a" in der Register Save Area
	str	wzr, [sp,24]	; rt=0
	str	wzr, [sp,28]	; i=0
	b	.L2
.L4:
	ldr	w0, [sp,28]
	mov	x1, 1
	lsl	x0, x1, x0	; X0 = X1<<X0 = 1<<i
	mov	x1, x0
; X1 = 1<<i
	ldr	x0, [sp,8]
; X0 = a
	and	x0, x1, x0
; X0 = X1&X0 = (1<<i) & a
; enthält X0 null? Dann springe zu .L3, lasse "rt" Inkrement aus
	cmp	x0, xzr
	beq	.L3
; rt++
	ldr	w0, [sp,24]
	add	w0, w0, 1
	str	w0, [sp,24]
.L3:
; i++
	ldr	w0, [sp,28]
	add	w0, w0, 1
	str	w0, [sp,28]
.L2:
; i<=63? Dann springe zu .L4
	ldr	w0, [sp,28]
	cmp	w0, 63
	ble	.L4
; return rt
	ldr	w0, [sp,24]
	add	sp, sp, 32
	ret
