printing_function:
; §préparer§ le second argument de printf():
	mov	w1, w0
; charger l'adresse de la §chaîne§ "f(%d)\n"
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
; seulement sauter ici au lieu de sauter avec lien et retour:
	b	printf
main:
; sauver FP et LR dans la pile locale:
	stp	x29, x30, [sp, -32]!
; §préparer§ une structure de pile:
	add	x29, sp, 0
; sauver le contenu du registre X19 dans la pile locale:
	str	x19, [sp,16]
; nous allons utiliser le registre W19 comme compteur.
; lui assigner une valeur initiale de 2:
	mov	w19, 2
.L3:
; §préparer§ le premier argument de printing_function():
	mov	w0, w19
; §incrémenter§ le registre compteur.
	add	w19, w19, 1
; ici W0 contient toujours la valeur du compteur avant §incrémentation§.
	bl	printing_function
; est-ce §terminé§?
	cmp	w19, 10
; non, sauter au §début§ du corps de boucle:
	bne	.L3
; renvoyer 0
	mov	w0, 0
; restaurer le contenu du registre X19:
	ldr	x19, [sp,16]
; restaurer les valeurs de FP et LR:
	ldp	x29, x30, [sp], 32
	ret
.LC0:
	.string	"f(%d)\n"
