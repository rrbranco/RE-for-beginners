	.comm	x,4,4
.LC0:
	.string	"Enter X:"
.LC1:
	.string	"%d"
.LC2:
	.string	"You entered %d...\n"
f5:
; save FP and LR in stack frame:
	stp	x29, x30, [sp, -16]!
; set stack frame (FP=SP)
	add	x29, sp, 0
; load pointer to the "Enter X:" string:
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	puts
; load pointer to the "%d" string:
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
; form address of x global variable:
	adrp	x1, x
	add	x1, x1, :lo12:x
	bl	__isoc99_scanf
; form address of x global variable again:
	adrp	x0, x
	add	x0, x0, :lo12:x
; load value from memory at this address:
	ldr	w1, [x0]
; load pointer to the "You entered %d...\n" string:
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printf
; return 0
	mov	w0, 0
; restore FP and LR:
	ldp	x29, x30, [sp], 16
	ret
