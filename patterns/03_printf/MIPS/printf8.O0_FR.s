$LC0:
	.ascii	"a=%d; b=%d; c=%d; d=%d; e=%d; f=%d; g=%d; h=%d\012\000"
main:
; prologue de la fonction:
	addiu	$sp,$sp,-56
	sw	$31,52($sp)
	sw	$fp,48($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	lui	$2,%hi($LC0)
	addiu	$2,$2,%lo($LC0)
; §passer le 5ème argument dans la pile:§
	li	$3,4			# 0x4
	sw	$3,16($sp)
; §passer le 6ème argument dans la pile:§
	li	$3,5			# 0x5
	sw	$3,20($sp)
; §passer le 7ème argument dans la pile:§
	li	$3,6			# 0x6
	sw	$3,24($sp)
; §passer le 8ème argument dans la pile:§
	li	$3,7			# 0x7
	sw	$3,28($sp)
; §passer le 9ème argument dans la pile:§
	li	$3,8			# 0x8
	sw	$3,32($sp)
; passer le 1er argument dans $a0: 
	move	$4,$2
; passer le 2nd argument dans $a1:
	li	$5,1			# 0x1
; §passer le 3ème argument dans§ $a2:
	li	$6,2			# 0x2
; §passer le 4ème argument dans§ $a3:
	li	$7,3			# 0x3
; appeler printf():
	lw	$2,%call16(printf)($28)
	nop
	move	$25,$2
	jalr	$25
	nop
; §épilogue de la fonction:§
	lw	$28,40($fp)
; §mettre la valeur de retour à 0:§
	move	$2,$0
	move	$sp,$fp
	lw	$31,52($sp)
	lw	$fp,48($sp)
	addiu	$sp,$sp,56
; retourner
	j	$31
	nop
