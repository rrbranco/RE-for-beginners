str_trim:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	str	x0, [x29,24] ; скопировать входной аргумент в локальный стек
	ldr	x0, [x29,24] ; s
	bl	strlen
	str	x0, [x29,40] ; переменная str_len в локальном стеке
	b	.L2
; начало главного цикла
.L5:
	ldrb	w0, [x29,39]
; W0=c
	cmp	w0, 13       ; это '\r'?
	beq	.L3
	ldrb	w0, [x29,39]
; W0=c
	cmp	w0, 10       ; это '\n'?
	bne	.L4          ; перейти в конец, если нет
.L3:
	ldr	x0, [x29,40]
; X0=str_len
	sub	x0, x0, #1
; X0=str_len-1
	ldr	x1, [x29,24]
; X1=s
	add	x0, x1, x0
; X0=s+str_len-1
	strb	wzr, [x0]    ; записать байт на s+str_len-1
; декремент str_len:
	ldr	x0, [x29,40]
; X0=str_len
	sub	x0, x0, #1
; X0=str_len-1
	str	x0, [x29,40]
; сохранить X0 (§или§ str_len-1) в локальном стеке
.L2:
	ldr	x0, [x29,40]
; str_len==0?
	cmp	x0, xzr
; перейти на выход, если да
	beq	.L4
	ldr	x0, [x29,40]
; X0=str_len
	sub	x0, x0, #1
; X0=str_len-1
	ldr	x1, [x29,24]
; X1=s
	add	x0, x1, x0
; X0=s+str_len-1
; загрузить байт по адресу s+str_len-1 в W0
	ldrb	w0, [x0]
	strb	w0, [x29,39] ; сохранить загруженный байт в "c"
	ldrb	w0, [x29,39] ; перезагрузить его
; это нулевой байт?
	cmp	w0, wzr
; перейти на конец, если это ноль, или на L5, если нет
	bne	.L5
.L4:
; возврат s
	ldr	x0, [x29,24]
	ldp	x29, x30, [sp], 48
	ret
