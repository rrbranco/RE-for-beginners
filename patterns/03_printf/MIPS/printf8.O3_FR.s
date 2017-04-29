$LC0:
	.ascii	"a=%d; b=%d; c=%d; d=%d; e=%d; f=%d; g=%d; h=%d\012\000"
main:
; prologue de la fonction:
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-56
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,52($sp)
; §passer le 5ème argument dans la pile:§
	li	$2,4			# 0x4
	sw	$2,16($sp)
; §passer le 6ème argument dans la pile:§
	li	$2,5			# 0x5
	sw	$2,20($sp)
; §passer le 7ème argument dans la pile:§
	li	$2,6			# 0x6
	sw	$2,24($sp)
; §passer le 8ème argument dans la pile:§
	li	$2,7			# 0x7
	lw	$25,%call16(printf)($28)
	sw	$2,28($sp)
; passer le 1er argument dans $a0:
	lui	$4,%hi($LC0)
; §passer le 9ème argument dans la pile:§
	li	$2,8			# 0x8
	sw	$2,32($sp)
	addiu	$4,$4,%lo($LC0)
; passer le 2nd argument dans $a1:
	li	$5,1			# 0x1
; §passer le 3ème argument dans§ $a2:
	li	$6,2			# 0x2
; appeler printf():
	jalr	$25
; §passer le 4ème argument dans \$a3 (slot de délai de branchement):§
	li	$7,3			# 0x3

; §épilogue de la fonction:§
	lw	$31,52($sp)
; §mettre la valeur de retour à 0:§
	move	$2,$0
; retourner
	j	$31
	addiu	$sp,$sp,56 ; §slot de délai de branchement§
