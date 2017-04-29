$LC0:
	.ascii	"a=%d; b=%d; c=%d\000"
main:
; function prologue:
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
; load address of the text string:
	lui	$2,%hi($LC0)
	addiu	$2,$2,%lo($LC0)
; set 1st argument of printf():
	move	$4,$2
; set 2nd argument of printf():
	li	$5,1			# 0x1
; set 3rd argument of printf():
	li	$6,2			# 0x2
; set 4th argument of printf():
	li	$7,3			# 0x3
; get address of printf():
	lw	$2,%call16(printf)($28)
	nop
; call printf():
	move	$25,$2
	jalr	$25
	nop

; function epilogue:
	lw	$28,16($fp)
; set return value to 0:
	move	$2,$0
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
; return
	j	$31
	nop
