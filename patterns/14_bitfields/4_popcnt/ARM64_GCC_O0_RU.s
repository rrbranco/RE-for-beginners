f:
	sub	sp, sp, #32
	str	x0, [sp,8]	; сохранить значение "a" в Register Save Area
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
; X0 содержит ноль? тогда перейти на .L3, пропуская инкремент "rt"
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
; i<=63? тогда перейти на .L4
	ldr	w0, [sp,28]
	cmp	w0, 63
	ble	.L4
; возврат rt
	ldr	w0, [sp,24]
	add	sp, sp, 32
	ret
