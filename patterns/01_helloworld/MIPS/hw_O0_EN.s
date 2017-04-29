$LC0:
	.ascii	"Hello, world!\012\000"
main:
; function prologue.
; save the RA ($31) and FP in the stack:
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
; set the FP (stack frame pointer):
	move	$fp,$sp
; set the GP:
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
; load the address of the text string:
	lui	$2,%hi($LC0)
	addiu	$4,$2,%lo($LC0)
; load the address of puts() using the GP:
	lw	$2,%call16(puts)($28)
	nop
; call puts():
	move	$25,$2
	jalr	$25
	nop  ; branch delay slot

; restore the GP from the local stack:
	lw	$28,16($fp)
; set register $2 ($V0) to zero:
	move	$2,$0
; function epilogue.
; restore the SP:
	move	$sp,$fp
; restore the RA:
	lw	$31,28($sp)
; restore the FP:
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
; jump to the RA:
	j	$31
	nop  ; branch delay slot
