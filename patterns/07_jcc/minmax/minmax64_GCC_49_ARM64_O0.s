my_max:
	sub	sp, sp, #16
	str	x0, [sp,8]
	str	x1, [sp]
	ldr	x1, [sp,8]
	ldr	x0, [sp]
	cmp	x1, x0
	ble	.L2
	ldr	x0, [sp,8]
	b	.L3
.L2:
	ldr	x0, [sp]
.L3:
	add	sp, sp, 16
	ret

my_min:
	sub	sp, sp, #16
	str	x0, [sp,8]
	str	x1, [sp]
	ldr	x1, [sp,8]
	ldr	x0, [sp]
	cmp	x1, x0
	bge	.L5
	ldr	x0, [sp,8]
	b	.L6
.L5:
	ldr	x0, [sp]
.L6:
	add	sp, sp, 16
	ret
