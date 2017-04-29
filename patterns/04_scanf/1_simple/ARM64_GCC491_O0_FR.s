.LC0:
	.string	"Enter X:"
.LC1:
	.string	"%d"
.LC2:
	.string	"You entered %d...\n"
scanf_main:
; soustraire 32 de SP, puis sauver FP et LR dans la structure de pile:
	stp	x29, x30, [sp, -32]!
; utiliser la partie de pile (FP=SP)
	add	x29, sp, 0
; §charger le pointeur sur la chaîne§  "Enter X:":
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
; §X0=pointeur sur la chaîne§ "Enter X:"
; l'afficher:
	bl	puts
; §charger le pointeur sur la chaîne§ "%d":
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
; trouver de l'espace dans la structure de pile pour la variable "x" (X1=FP+28):
	add	x1, x29, 28
; X1=adresse de la variable "x"
; passer l'adresse  de scanf() et l'appeler:
	bl	__isoc99_scanf
; charger la valeur 32-bit de la variable dans la partie de pile:
	ldr	w1, [x29,28]
; W1=x
; §charger le pointeur sur la chaîne§ "You entered %d...\n"
; §printf() va prendre la chaîne de texte de  X0 et de la variable "x" de X1 (ou W1)§
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printf
; retourner 0
	mov	w0, 0
; §restaurer FP et LR, puis ajouter 32 à SP:§
	ldp	x29, x30, [sp], 32
	ret
