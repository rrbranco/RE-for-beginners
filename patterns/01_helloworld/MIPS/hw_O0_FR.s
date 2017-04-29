$LC0:
	.ascii	"Hello, world!\012\000"
main:
; prologue de la fonction.
; sauver RA ($31) et FP sur la pile:
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
; §définir le pointeur de pile FP§ (stack frame pointer):
	move	$fp,$sp
; §définir GP:§
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
; §charger l'adresse de la chaîne de texte:§
	lui	$2,%hi($LC0)
	addiu	$4,$2,%lo($LC0)
; charger l'adresse de puts() en utilisant GP:
	lw	$2,%call16(puts)($28)
	nop
; appeler puts():
	move	$25,$2
	jalr	$25
	nop  ; slot de retard de branchement

; restaurer GP depuis la pile locale:
	lw	$28,16($fp)
; §mettre le registre \$2 (\$V0) à zéro:§
	move	$2,$0
; §épilogue de la fonction.§
; restaurer SP:
	move	$sp,$fp
; restaurer RA:
	lw	$31,28($sp)
; restaurer FP:
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
; sauter en RA:
	j	$31
	nop  ; §slot de délai de branchement§
