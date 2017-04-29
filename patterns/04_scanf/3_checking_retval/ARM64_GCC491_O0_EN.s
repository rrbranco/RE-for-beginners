.LC0:
	.string	"Enter X:"
.LC1:
	.string	"%d"
.LC2:
	.string	"You entered %d...\n"
.LC3:
	.string	"What you entered? Huh?"
f6:
; save FP and LR in stack frame:
	stp	x29, x30, [sp, -32]!
; set stack frame (FP=SP)
	add	x29, sp, 0
; load pointer to the "Enter X:" string:
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	puts
; load pointer to the "%d" string:
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
; calculate address of x variable in the local stack
	add	x1, x29, 28
	bl	__isoc99_scanf
; scanf() returned result in W0.
; check it:
	cmp	w0, 1
; BNE is Branch if Not Equal 
; so if W0<>0, jump to L2 will be occurred
	bne	.L2
; at this moment W0=1, meaning no error
; load x value from the local stack
	ldr	w1, [x29,28]
; load pointer to the "You entered %d...\n" string:
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printf
; skip the code, which print the "What you entered? Huh?" string:
	b	.L3
.L2:
; load pointer to the "What you entered? Huh?" string:
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	puts
.L3:
; return 0
	mov	w0, 0
; restore FP and LR:
	ldp	x29, x30, [sp], 32
	ret
