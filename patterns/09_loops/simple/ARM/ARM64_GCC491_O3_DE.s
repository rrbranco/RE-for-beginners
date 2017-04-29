printing_function:
; zweites Argument von printf() vorbereiten:
	mov	w1, w0
; lade Adresse des "f(%d)\n" Strings
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
; verzweige nur hier, anstatt Verzweigungen zu link und
return:
	b	printf
main:
; speichern von FP und LR auf dem lokalen Stack:
	stp	x29, x30, [sp, -32]!
; setze Stack Frame:
	add	x29, sp, 0
; Inhalt des X19 Registers auf dem Stack ablegen
	str	x19, [sp,16]
; §wir verwenden das W19 Register als Zähler.§
; weise diesem den Startwert 2 zu:
	mov	w19, 2
.L3:
; erstes Argument von printing_function() vorbereiten:
	mov	w0, w19
; §Zählerregister inkrementieren.§
	add	w19, w19, 1
; §W0 enthält hier immer noch den Wert des Zählers vor dem Inkrement.§
	bl	printing_function
; am Ende?
	cmp	w19, 10
; §nein, dann springe zum Anfang des Schleifenkörpers:§
	bne	.L3
; return 0
	mov	w0, 0
; wiederherstellen des X19 Registers:
	ldr	x19, [sp,16]
; wiederherstellen von FP und LR:
	ldp	x29, x30, [sp], 32
	ret
.LC0:
	.string	"f(%d)\n"
