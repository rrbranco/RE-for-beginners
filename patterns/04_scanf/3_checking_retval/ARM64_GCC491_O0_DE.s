.LC0:
	.string	"Enter X:"
.LC1:
	.string	"%d"
.LC2:
	.string	"You entered %d...\n"
.LC3:
	.string	"What you entered? Huh?"
f6:
; speichere FP und LR auf dem Stack Frame:
	stp	x29, x30, [sp, -32]!
; setze Stack Frame (FP=SP)
	add	x29, sp, 0
; lade Pointer auf den "Enter X:" String:
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	puts
; lade Pointer auf den "%d" String:
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
; berechne Adresse von x auf dem lokalen Stack
	add	x1, x29, 28
	bl	__isoc99_scanf
; scanf() liefert Ergebnis nach W0.
; §prüfen:§
	cmp	w0, 1
; BNE ist Branch if Not Equal 
; also, falls W0<>0, springe zu L2
	bne	.L2
; hier ist W0=1, also kein Fehler
; lade Wert x vom lokalen Stack
	ldr	w1, [x29,28]
; lade Pointer auf den "You entered %d...\n" String:
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printf
; §Code überspringen, der "What you entered? Huh?" ausgibt:§
	b	.L3
.L2:
; lade Pointer auf den "What you entered? Huh?" String:
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	puts
.L3:
; return 0
	mov	w0, 0
; wiederherstellen von FP und LR:
	ldp	x29, x30, [sp], 32
	ret
