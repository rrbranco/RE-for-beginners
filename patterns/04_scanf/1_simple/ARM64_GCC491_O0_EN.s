.LC0:
	.string	"Enter X:"
.LC1:
	.string	"%d"
.LC2:
	.string	"You entered %d...\n"
scanf_main:
; subtract 32 from SP, then save FP and LR in stack frame:
	stp	x29, x30, [sp, -32]!
; set stack frame (FP=SP)
	add	x29, sp, 0
; load pointer to the "Enter X:" string:
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
; X0=pointer to the "Enter X:" string
; print it:
	bl	puts
; load pointer to the "%d" string:
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
; find a space in stack frame for "x" variable (X1=FP+28):
	add	x1, x29, 28
; X1=address of "x" variable
; pass the address to scanf() and call it:
	bl	__isoc99_scanf
; load 32-bit value from the variable in stack frame:
	ldr	w1, [x29,28]
; W1=x
; load pointer to the "You entered %d...\n" string
; printf() will take text string from X0 and "x" variable from X1 (or W1)
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printf
; return 0
	mov	w0, 0
; restore FP and LR, then add 32 to SP:
	ldp	x29, x30, [sp], 32
	ret
