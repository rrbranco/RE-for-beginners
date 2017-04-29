$LC0:
	.ascii	"a=%d; b=%d; c=%d\000"
main:
; prologue de la fonction:
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-32
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,28($sp)
; charger l'adresse de printf():
	lw	$25,%call16(printf)($28)
; §charger l'adresse de la chaîne de texte et mettre le 1er argument de printf():§
	lui	$4,%hi($LC0)
	addiu	$4,$4,%lo($LC0)
; mettre le 2nd argument de printf():
	li	$5,1			# 0x1
; §mettre le 3ème argument de printf():§
	li	$6,2			# 0x2
; appeler printf():
	jalr	$25
; §mettre le 4ème argument de printf() (slot de délai branchement):§
	li	$7,3			# 0x3

; §épilogue de la fonction:§
	lw	$31,28($sp)
; §mettre la valeur de retour à 0:§
	move	$2,$0
; retourner
	j	$31
	addiu	$sp,$sp,32 ; §slot de délai de branchement§
