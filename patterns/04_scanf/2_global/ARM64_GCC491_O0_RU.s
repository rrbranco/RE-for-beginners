	.comm	x,4,4
.LC0:
	.string	"Enter X:"
.LC1:
	.string	"%d"
.LC2:
	.string	"You entered %d...\n"
f5:
; сохранить FP и LR в стековом фрейме:
	stp	x29, x30, [sp, -16]!
; установить стековый фрейм (FP=SP)
	add	x29, sp, 0
; загрузить указатель на строку "Enter X:":
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	puts
; загрузить указатель на строку "%d":
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
; сформировать адрес глобальной переменной x:
	adrp	x1, x
	add	x1, x1, :lo12:x
	bl	__isoc99_scanf
; снова сформировать адрес глобальной переменной x:
	adrp	x0, x
	add	x0, x0, :lo12:x
; загрузить значение из памяти по этому адресу:
	ldr	w1, [x0]
; загрузить указатель на строку "You entered %d...\n":
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printf
; возврат 0
	mov	w0, 0
; восстановить FP и LR:
	ldp	x29, x30, [sp], 16
	ret
