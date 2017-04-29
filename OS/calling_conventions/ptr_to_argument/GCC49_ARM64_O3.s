f:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0         ; setup FP
	add	x1, x29, 32        ; calculate address of variable in Register Save Area
	str	w0, [x1,-4]!       ; store input value there
	mov	x0, x1             ; pass address of variable to the modify_a()
	bl	modify_a
	ldr	w1, [x29,28]       ; load value from the variable and pass it to printf()
	adrp	x0, .LC0 ; '%d'
	add	x0, x0, :lo12:.LC0
	bl	printf             ; call printf()
	ldp	x29, x30, [sp], 32
	ret
.LC0:
	.string	"%d\n"
