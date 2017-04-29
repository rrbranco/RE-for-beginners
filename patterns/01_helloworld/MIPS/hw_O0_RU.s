$LC0:
	.ascii	"Hello, world!\012\000"
main:
; пролог функции
; сохранить RA ($31) и FP в стеке:
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
; §установить FP (указатель стекового фрейма)§:
	move	$fp,$sp
; установить GP:
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
; загрузить адрес текстовой строки:
	lui	$2,%hi($LC0)
	addiu	$4,$2,%lo($LC0)
; загрузить адрес функции puts() используя GP:
	lw	$2,%call16(puts)($28)
	nop
; вызвать puts():
	move	$25,$2
	jalr	$25
	nop  ; branch delay slot

; восстановить GP из локального стека:
	lw	$28,16($fp)
; установить регистр $2 ($V0) в ноль:
	move	$2,$0
; эпилог функции.
; восстановить SP:
	move	$sp,$fp
; восстановить RA:
	lw	$31,28($sp)
; восстановить FP:
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
; переход на RA:
	j	$31
	nop  ; branch delay slot
