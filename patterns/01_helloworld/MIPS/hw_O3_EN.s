$LC0:
; \000 is zero byte in octal base:
	.ascii	"Hello, world!\012\000"
main:
; function prologue.
; set the GP:
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-32
	addiu	$28,$28,%lo(__gnu_local_gp)
; save the RA to the local stack:
	sw	$31,28($sp)
; load the address of the puts() function from the GP to $25:
	lw	$25,%call16(puts)($28)
; load the address of the text string to $4 ($a0):
	lui	$4,%hi($LC0)
; jump to puts(), saving the return address in the link register:
	jalr	$25
	addiu	$4,$4,%lo($LC0) ; branch delay slot
; restore the RA:
	lw	$31,28($sp)
; copy 0 from $zero to $v0:
	move	$2,$0
; return by jumping to the RA:
	j	$31
; function epilogue:
	addiu	$sp,$sp,32 ; branch delay slot + free local stack

