.LC0:
	.string	"f(%d)\n"
printing_function:
; speichere FP und LR auf dem lokalen Stack:
	stp	x29, x30, [sp, -32]!
; setze den Stack Frame:
	add	x29, sp, 0
; Inhalt des W0 Registers speichern:
	str	w0, [x29,28]
; lade Adresse des "f(%d)\n" Strings
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
; Eingabewert vom Stack zurück ins W1 Register laden:
	ldr	w1, [x29,28]
; Aufruf von printf()
	bl	printf
; wiederherstellen von FP und LR:
	ldp	x29, x30, [sp], 32
	ret
main:
; speichere FP und LR auf dem lokalen Stack:
	stp	x29, x30, [sp, -32]!
; setze den Stack Frame:
	add	x29, sp, 0
; §Zähler initialisieren§
	mov	w0, 2
; auf dem Stack an zugewiesener Stelle ablegen:
	str	w0, [x29,28]
; §Schleifenkörper überspringen und zur Bedingungsprüfung springen:§
	b	.L3
.L4:
; lade Zähler nach W0.
; als erstes Argument der printing_function():
	ldr	w0, [x29,28]
; Aufruf printing_function():
	bl	printing_function
; §Zähler erhöhen:§
	ldr	w0, [x29,28]
	add	w0, w0, 1
	str	w0, [x29,28]
.L3:
; §Bedingungsprüfung der Schleife.§
; §Zähler laden:§
	ldr	w0, [x29,28]
; ist 9 erreicht?
	cmp	w0, 9
; kleiner oder gleich? dann springe zum Anfang der Schleife:
; sonst tue nichts.
	ble	.L4
; return 0
	mov	w0, 0
; wiederherstellen von FP und LR:
	ldp	x29, x30, [sp], 32
	ret
