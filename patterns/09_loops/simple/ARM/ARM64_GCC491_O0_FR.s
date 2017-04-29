.LC0:
	.string	"f(%d)\n"
printing_function:
; sauver FP et LR dans la pile locale:
	stp	x29, x30, [sp, -32]!
; §préparer§ la pile locale:
	add	x29, sp, 0
; sauver le contenu du registre W0:
	str	w0, [x29,28]
; charger l'adresse de la chaîne "f(%d)\n"
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
; recharger la valeur §entrée§ depuis le pile locale dans le regsitre W0:
	ldr	w1, [x29,28]
; appeler printf()
	bl	printf
; restaurer les valeurs de FP et LR:
	ldp	x29, x30, [sp], 32
	ret
main:
; sauvegarder FP et LR sur la pile locale:
	stp	x29, x30, [sp, -32]!
; §préparer§ la structure de pile:
	add	x29, sp, 0
; initialiser le compteur
	mov	w0, 2
; le stocker dans l'espace §alloué§ pour lui dans la pile locale:
	str	w0, [x29,28]
; passer le corps de la boucle et sauter aux instructions de §vérification§ de la condition de boucle:
	b	.L3
.L4:
; charger la valeur du compteur dans W0.
; ce sera le premier argument de printing_function():
	ldr	w0, [x29,28]
; appeler printing_function():
	bl	printing_function
; §incrémenter§ la valeur du compteur:
	ldr	w0, [x29,28]
	add	w0, w0, 1
	str	w0, [x29,28]
.L3:
; tester condition de boucle.
; charger la valeur du compteur:
	ldr	w0, [x29,28]
; est-ce 9?
	cmp	w0, 9
; §inférieur ou égal? alors sauter au début du corps de boucle§:
; autrement, ne rien faire.
	ble	.L4
; renvoyer 0
	mov	w0, 0
; restaurer les valeurs de FP et LR:
	ldp	x29, x30, [sp], 32
	ret
