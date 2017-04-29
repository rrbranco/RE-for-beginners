.LC0:
	.string	"f(%d)\n"
printing_function:
; save FP and LR in the local stack:
	stp	x29, x30, [sp, -32]!
; set up stack frame:
	add	x29, sp, 0
; save contents of W0 register:
	str	w0, [x29,28]
; load address of the "f(%d)\n" string
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
; reload input value from the local stack to W1 register:
	ldr	w1, [x29,28]
; call printf()
	bl	printf
; restore FP and LR values:
	ldp	x29, x30, [sp], 32
	ret
main:
; save FP and LR in the local stack:
	stp	x29, x30, [sp, -32]!
; set up stack frame:
	add	x29, sp, 0
; initialize counter
	mov	w0, 2
; store it to the place allocated for it in the local stack:
	str	w0, [x29,28]
; skip loop body and jump to the loop condition check instructions:
	b	.L3
.L4:
; load counter value to W0.
; it will be the first argument of printing_function():
	ldr	w0, [x29,28]
; call printing_function():
	bl	printing_function
; increment counter value:
	ldr	w0, [x29,28]
	add	w0, w0, 1
	str	w0, [x29,28]
.L3:
; loop condition check.
; load counter value:
	ldr	w0, [x29,28]
; is it 9?
	cmp	w0, 9
; less or equal? then jump to loop body begin:
; do nothing otherwise.
	ble	.L4
; return 0
	mov	w0, 0
; restore FP and LR values:
	ldp	x29, x30, [sp], 32
	ret
