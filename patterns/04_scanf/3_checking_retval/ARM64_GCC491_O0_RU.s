.LC0:
	.string	"Enter X:"
.LC1:
	.string	"%d"
.LC2:
	.string	"You entered %d...\n"
.LC3:
	.string	"What you entered? Huh?"
f6:
; сохранить FP и LR в стековом фрейме:
	stp	x29, x30, [sp, -32]!
; установить стековый фрейм (FP=SP)
	add	x29, sp, 0
; загрузить указатель на строку "Enter X:"
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	puts
; загрузить указатель на строку "%d":
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
; вычислить адрес переменной x в локальном стеке
	add	x1, x29, 28
	bl	__isoc99_scanf
; scanf() возвращает результат в W0.
; проверяем его:
	cmp	w0, 1
; BNE это Branch if Not Equal §(переход, если не равно)§
; так что если W0<>0, произойдет переход на L2
	bne	.L2
; в этот момент W0=1, означая, что ошибки не было
; загрузить значение x из локального стека
	ldr	w1, [x29,28]
; загрузить указатель на строку "You entered %d...\n":
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printf
; ропустить код, печатающий строку "What you entered? Huh?" :
	b	.L3
.L2:
; загрузить указатель на строку "What you entered? Huh?" :
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	puts
.L3:
; возврат 0
	mov	w0, 0
; восстановить FP и LR:
	ldp	x29, x30, [sp], 32
	ret
