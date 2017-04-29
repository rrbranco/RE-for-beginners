printing_function:
; prepare second argument of printf():
	mov	w1, w0
; load address of the "f(%d)\n" string
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
; just branch here instead of branch with link and return:
	b	printf
main:
; save FP and LR in the local stack:
	stp	x29, x30, [sp, -32]!
; set up stack frame:
	add	x29, sp, 0
; save contents of X19 register in the local stack:
	str	x19, [sp,16]
; we will use W19 register as counter.
; set initial value of 2 to it:
	mov	w19, 2
.L3:
; prepare first argument of printing_function():
	mov	w0, w19
; increment counter register.
	add	w19, w19, 1
; W0 here still holds value of counter value before increment.
	bl	printing_function
; is it end?
	cmp	w19, 10
; no, jump to the loop body begin:
	bne	.L3
; return 0
	mov	w0, 0
; restore contents of X19 register:
	ldr	x19, [sp,16]
; restore FP and LR values:
	ldp	x29, x30, [sp], 32
	ret
.LC0:
	.string	"f(%d)\n"
