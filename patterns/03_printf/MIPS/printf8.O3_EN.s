$LC0:
	.ascii	"a=%d; b=%d; c=%d; d=%d; e=%d; f=%d; g=%d; h=%d\012\000"
main:
; function prologue:
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-56
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,52($sp)
; pass 5th argument in stack:
	li	$2,4			# 0x4
	sw	$2,16($sp)
; pass 6th argument in stack:
	li	$2,5			# 0x5
	sw	$2,20($sp)
; pass 7th argument in stack:
	li	$2,6			# 0x6
	sw	$2,24($sp)
; pass 8th argument in stack:
	li	$2,7			# 0x7
	lw	$25,%call16(printf)($28)
	sw	$2,28($sp)
; pass 1st argument in $a0: 
	lui	$4,%hi($LC0)
; pass 9th argument in stack:
	li	$2,8			# 0x8
	sw	$2,32($sp)
	addiu	$4,$4,%lo($LC0)
; pass 2nd argument in $a1:
	li	$5,1			# 0x1
; pass 3rd argument in $a2:
	li	$6,2			# 0x2
; call printf():
	jalr	$25
; pass 4th argument in $a3 (branch delay slot):
	li	$7,3			# 0x3

; function epilogue:
	lw	$31,52($sp)
; set return value to 0:
	move	$2,$0
; return
	j	$31
	addiu	$sp,$sp,56 ; branch delay slot
