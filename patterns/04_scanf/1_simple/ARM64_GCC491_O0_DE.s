.LC0:
	.string	"Enter X:"
.LC1:
	.string	"%d"
.LC2:
	.string	"You entered %d...\n"
scanf_main:
; subtrahiere 32 von SP, speichere dann FP und LR im Stack Frame:
	stp	x29, x30, [sp, -32]!
; setze Stack Frame (FP=SP)
	add	x29, sp, 0
; lade Pointer auf den "Enter X:" String:
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
; X0=Pointer auf den "Enter X:" String
; print it:
	bl	puts
; lade Pointer auf den "%d" String:
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
; §finde Platz im Stack Frame für die Variable "x" (X1=FP+28):§
	add	x1, x29, 28
; X1=Adresse der Variablen "x"
; §übergebe die Adresse and scanf() und rufe auf:§
	bl	__isoc99_scanf
; lade 32-Bit-Wert aus der Variable in den Stack Frame:
	ldr	w1, [x29,28]
; W1=x
; lade Pointer auf den "You entered %d...\n" String
; printf() nimmt den Textstring aus X0 und die Variable "x" aus X1 (oder W1)
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printf
; return 0
	mov	w0, 0
; stelle FP und LR wieder her, addiere dann 32 zu SP:
	ldp	x29, x30, [sp], 32
	ret
