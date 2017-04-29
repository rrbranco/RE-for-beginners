$LC0:
	.ascii	"a=%d; b=%d; c=%d\000"
main:
; function prologue:
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-32
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,28($sp)
; load address of printf():
	lw	$25,%call16(printf)($28)
; load address of the text string and set 1st argument of printf():
	lui	$4,%hi($LC0)
	addiu	$4,$4,%lo($LC0)
; set 2nd argument of printf():
	li	$5,1			# 0x1
; set 3rd argument of printf():
	li	$6,2			# 0x2
; call printf():
	jalr	$25
; set 4th argument of printf() (branch delay slot):
	li	$7,3			# 0x3

; function epilogue:
	lw	$31,28($sp)
; set return value to 0:
	move	$2,$0
; return
	j	$31
	addiu	$sp,$sp,32 ; branch delay slot
