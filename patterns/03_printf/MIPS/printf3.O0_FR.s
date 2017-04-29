$LC0:
	.ascii	"a=%d; b=%d; c=%d\000"
main:
; prologue de la fonction:
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
; §charger l'adresse de la chaîne de texte:§
	lui	$2,%hi($LC0)
	addiu	$2,$2,%lo($LC0)
; mettre le 1er argument de printf():
	move	$4,$2
; mettre le 2nd argument de printf():
	li	$5,1			# 0x1
; §mettre le 3ème argument de printf():§
	li	$6,2			# 0x2
; §mettre le 4ème argument de printf():§
	li	$7,3			# 0x3
; charger l'adresse de printf():
	lw	$2,%call16(printf)($28)
	nop
; appeler printf():
	move	$25,$2
	jalr	$25
	nop

; §épilogue de la fonction:§
	lw	$28,16($fp)
; §mettre la valeur de retour à 0:§
	move	$2,$0
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
; retourner
	j	$31
	nop
