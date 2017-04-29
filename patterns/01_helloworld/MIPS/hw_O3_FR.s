$LC0:
; \000 §est l'octet à zéro en base octale:§
	.ascii	"Hello, world!\012\000"
main:
; prologue de la fonction.
; §définir GP:§
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-32
	addiu	$28,$28,%lo(__gnu_local_gp)
; sauver RA sur la pile locale:
	sw	$31,28($sp)
; charger l'adresse de la fonction puts() dans $25 depuis GP:
	lw	$25,%call16(puts)($28)
; §charger l'adresse de la chaîne de texte dans \$4 (\$a0):§
	lui	$4,%hi($LC0)
; §sauter à puts(), en sauvant l'adresse de retour dans le register link:§
	jalr	$25
	addiu	$4,$4,%lo($LC0) ; slot de retard de branchement
; restaurer RA:
	lw	$31,28($sp)
; copier 0 depuis $zero dans $v0:
	move	$2,$0
; §retourner en sautant à la valeur dans RA:§
	j	$31
; §épilogue de la fonction:§
	addiu	$sp,$sp,32 ; §slot de retard de branchement + libérer la pile locale§
