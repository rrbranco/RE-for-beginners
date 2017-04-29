$LC0:
	.ascii	"a=%d; b=%d; c=%d\000"
main:
; пролог функции:
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
; загрузить адрес текстовой строки:
	lui	$2,%hi($LC0)
	addiu	$2,$2,%lo($LC0)
; установить первый аргумент printf():
	move	$4,$2
; установить второй аргумент printf():
	li	$5,1			# 0x1
; установить третий аргумент printf():
	li	$6,2			# 0x2
; установить четвертый аргумент printf():
	li	$7,3			# 0x3
; получить адрес printf():
	lw	$2,%call16(printf)($28)
	nop
; вызов printf():
	move	$25,$2
	jalr	$25
	nop

; эпилог функции:
	lw	$28,16($fp)
; установить возвращаемое значение в 0:
	move	$2,$0
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
; возврат
	j	$31
	nop
