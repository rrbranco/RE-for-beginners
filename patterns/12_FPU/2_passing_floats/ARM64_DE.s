f:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	ldr	d1, .LC1 ; lade 1.54 nach D1
	ldr	d0, .LC0 ; lade 32.01 nach D0
	bl	pow
; Ergebnis von pow() in D0
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printf
	mov	w0, 0
	ldp	x29, x30, [sp], 16
	ret
.LC0:
; 32.01 im IEEE 754 Format
	.word	-1374389535
	.word	1077936455
.LC1:
; 1.54 im IEEE 754 Format
	.word	171798692
	.word	1073259479
.LC2:
	.string	"32.01 ^ 1.54 = %lf\n"
