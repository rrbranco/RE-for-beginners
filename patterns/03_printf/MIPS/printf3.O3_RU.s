$LC0:
	.ascii	"a=%d; b=%d; c=%d\000"
main:
; пролог функции:
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-32
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,28($sp)
; загрузить адрес printf():
	lw	$25,%call16(printf)($28)
; загрузить адрес текстовой строки и установить первый аргумент printf():
	lui	$4,%hi($LC0)
	addiu	$4,$4,%lo($LC0)
; установить второй аргумент printf():
	li	$5,1			# 0x1
; установить третий аргумент printf():
	li	$6,2			# 0x2
; вызов printf():
	jalr	$25
; установить четвертый аргумент printf() (branch delay slot):
	li	$7,3			# 0x3

; эпилог функции:
	lw	$31,28($sp)
; установить возвращаемое значение в 0:
	move	$2,$0
; возврат
	j	$31
	addiu	$sp,$sp,32 ; branch delay slot
