.LC0:
	.string	"Enter X:"
.LC1:
	.string	"%d"
.LC2:
	.string	"You entered %d...\n"
.LC3:
	.string	"What you entered? Huh?"
f6:
; sauver FP et LR dans la structure de pile locale:
	stp	x29, x30, [sp, -32]!
; §définir la pile locale (FP=SP)§
	add	x29, sp, 0
; §charger le pointeur sur la chaîne§ "Enter X:":
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	puts
; §charger le pointeur sur la chaîne§ "%d":
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
; calculer l'adresse de la variable x dans la pile locale
	add	x1, x29, 28
	bl	__isoc99_scanf
; §scanf() renvoie son résultat dans W0.§
; §le vérifier:§
	cmp	w0, 1
; §BNE est Branch if Not Equal (branchement si non égal)§
; §donc if W0<>0, un saut en L2 sera effectué§
	bne	.L2
; §à ce point W0=1, signifie pas d'erreur§
; charger la valeur de x depuis la pile locale
	ldr	w1, [x29,28]
; §charger le pointeur sur la chaîne§ "You entered %d...\n":
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printf
; §sauter le code, qui affiche la chaîne§ "What you entered? Huh?":
	b	.L3
.L2:
; §charger le pointeur sur la chaîne§ "What you entered? Huh?":
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	puts
.L3:
; retourner 0
	mov	w0, 0
; restaurer FP et LR:
	ldp	x29, x30, [sp], 32
	ret
