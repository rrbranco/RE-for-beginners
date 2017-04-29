.LC0:
	.string	"a[%d]=%d\n"
main:
; save FP and LR in stack frame:
	stp	x29, x30, [sp, -112]!
; set stack frame (FP=SP)
	add	x29, sp, 0
; setting initial counter variable at 0 (WZR is the register always holding zero):
	str	wzr, [x29,108]
; jump to loop condition checking code:
	b	.L2
.L3:
; load value of "i" variable:
	ldr	w0, [x29,108]
; multiplicate it by 2:
	lsl	w2, w0, 1
; find a place of an array in local stack:
	add	x0, x29, 24
; load 32-bit integer from local stack and sign extend it to 64-bit one:
	ldrsw	x1, [x29,108]
; calculate address of element (X0+X1<<2=array address+i*4) and store W2 (i*2) there:
	str	w2, [x0,x1,lsl 2]
; increment counter (i):
	ldr	w0, [x29,108]
	add	w0, w0, 1
	str	w0, [x29,108]
.L2:
; check if we finished:
	ldr	w0, [x29,108]
	cmp	w0, 19
; jump to L3 (loop body begin) if not:
	ble	.L3
; second part of the function begins here.
; setting initial counter variable at 0.
; by the way, the same place in the local stack was used for counter,
; because the same local variable (i) is being used as counter.
	str	wzr, [x29,108]
	b	.L4
.L5:
; calculate array address:
	add	x0, x29, 24
; load "i" value:
	ldrsw	x1, [x29,108]
; load value from the array at the address (X0+X1<<2 = address of array + i*4)
	ldr	w2, [x0,x1,lsl 2]
; load address of the "a[%d]=%d\n" string:
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
; load "i" variable to W1 and pass it to printf() as second argument:
	ldr	w1, [x29,108]
; W2 still contains the value of array element which was just loaded.
; call printf():
	bl	printf
; increment "i" variable:
	ldr	w0, [x29,108]
	add	w0, w0, 1
	str	w0, [x29,108]
.L4:
; are we finished?
	ldr	w0, [x29,108]
	cmp	w0, 19
; jump to the loop body begin if not:
	ble	.L5
; return 0
	mov	w0, 0
; restore FP and LR:
	ldp	x29, x30, [sp], 112
	ret
