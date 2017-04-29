$LC0:
	.ascii	"a=%d; b=%d; c=%d; d=%d; e=%d; f=%d; g=%d; h=%d\012\000"
main:
; function prologue:
	addiu	$sp,$sp,-56
	sw	$31,52($sp)
	sw	$fp,48($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	lui	$2,%hi($LC0)
	addiu	$2,$2,%lo($LC0)
; pass 5th argument in stack:
	li	$3,4			# 0x4
	sw	$3,16($sp)
; pass 6th argument in stack:
	li	$3,5			# 0x5
	sw	$3,20($sp)
; pass 7th argument in stack:
	li	$3,6			# 0x6
	sw	$3,24($sp)
; pass 8th argument in stack:
	li	$3,7			# 0x7
	sw	$3,28($sp)
; pass 9th argument in stack:
	li	$3,8			# 0x8
	sw	$3,32($sp)
; pass 1st argument in $a0: 
	move	$4,$2
; pass 2nd argument in $a1:
	li	$5,1			# 0x1
; pass 3rd argument in $a2:
	li	$6,2			# 0x2
; pass 4th argument in $a3:
	li	$7,3			# 0x3
; call printf():
	lw	$2,%call16(printf)($28)
	nop
	move	$25,$2
	jalr	$25
	nop
; function epilogue:
	lw	$28,40($fp)
; set return value to 0:
	move	$2,$0
	move	$sp,$fp
	lw	$31,52($sp)
	lw	$fp,48($sp)
	addiu	$sp,$sp,56
; return
	j	$31
	nop
