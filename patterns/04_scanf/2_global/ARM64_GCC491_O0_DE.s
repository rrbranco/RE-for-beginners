	.comm	x,4,4
.LC0:
	.string	"Enter X:"
.LC1:
	.string	"%d"
.LC2:
	.string	"You entered %d...\n"
f5:
; speichere FP und LR im Stack Frame:
	stp	x29, x30, [sp, -16]!
; setze Stack Frame (FP=SP)
	add	x29, sp, 0
; lade Pointer auf den "Enter X:" String:
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	puts
; lade Pointer auf den "%d" String:
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
; bilde Adresse der globalen Variable x:
	adrp	x1, x
	add	x1, x1, :lo12:x
	bl	__isoc99_scanf
; bilde Adress der globalen Variable x erneut:
	adrp	x0, x
	add	x0, x0, :lo12:x
; lade Wert aus dem Speicher an dieser Adresse:
	ldr	w1, [x0]
; lade Pointer auf den "You entered %d...\n" string:
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printf
; return 0
	mov	w0, 0
; stelle FP und LR wieder her:
	ldp	x29, x30, [sp], 16
	ret
