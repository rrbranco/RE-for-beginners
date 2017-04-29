	.comm	x,4,4
.LC0:
	.string	"Enter X:"
.LC1:
	.string	"%d"
.LC2:
	.string	"You entered %d...\n"
f5:
; sauver FP et LR dans la structure de pile locale:
	stp	x29, x30, [sp, -16]!
; §définir la pile locale§ (FP=SP)
	add	x29, sp, 0
; §charger le pointeur sur la chaîne§ "Enter X:":
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	puts
; §charger le pointeur sur la chaîne§ "%d":
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
; §générer l'adresse de la variable globale x:§
	adrp	x1, x
	add	x1, x1, :lo12:x
	bl	__isoc99_scanf
; §générer à nouveau l'adresse de la variable globale x:§
	adrp	x0, x
	add	x0, x0, :lo12:x
; §charger la valeur de la mémoire à cette adresse:§
	ldr	w1, [x0]
; §charger le pointeur sur la chaîne§ "You entered %d...\n":
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printf
; retourner 0
	mov	w0, 0
; restaurer FP et LR:
	ldp	x29, x30, [sp], 16
	ret
