f14:
; входное значение в W0
	sub	w0, w0, #1
	cmp	w0, 21
; переход если меньше или равно (§беззнаковое§):
	bls	.L9
.L2:
; вывести "default":
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	b	puts
.L9:
; загрузить адрес таблицы переходов в X1:
	adrp	x1, .L4
	add	x1, x1, :lo12:.L4
; W0=input_value-1
; загрузить байт из таблицы:
	ldrb	w0, [x1,w0,uxtw]
; загрузить адрес метки Lrtx:
	adr	x1, .Lrtx4
; умножить элемент из таблицы на 4 (§сдвинув§ §на§ 2 §бита§ §влево§) и прибавить (§или§ §вычесть§) к адресу Lrtx:
	add	x0, x1, w0, sxtb #2
; перейти на вычисленный адрес:
	br	x0
; эта метка указывает на сегмент кода (text):
.Lrtx4:
	.section	.rodata
; всё после выражения ".section" выделяется в сегменте только для чтения (rodata):
.L4:
	.byte	(.L3 - .Lrtx4) / 4     ; case 1
	.byte	(.L3 - .Lrtx4) / 4     ; case 2
	.byte	(.L5 - .Lrtx4) / 4     ; case 3
	.byte	(.L5 - .Lrtx4) / 4     ; case 4
	.byte	(.L5 - .Lrtx4) / 4     ; case 5
	.byte	(.L5 - .Lrtx4) / 4     ; case 6
	.byte	(.L3 - .Lrtx4) / 4     ; case 7
	.byte	(.L6 - .Lrtx4) / 4     ; case 8
	.byte	(.L6 - .Lrtx4) / 4     ; case 9
	.byte	(.L3 - .Lrtx4) / 4     ; case 10
	.byte	(.L2 - .Lrtx4) / 4     ; case 11
	.byte	(.L2 - .Lrtx4) / 4     ; case 12
	.byte	(.L2 - .Lrtx4) / 4     ; case 13
	.byte	(.L2 - .Lrtx4) / 4     ; case 14
	.byte	(.L2 - .Lrtx4) / 4     ; case 15
	.byte	(.L2 - .Lrtx4) / 4     ; case 16
	.byte	(.L2 - .Lrtx4) / 4     ; case 17
	.byte	(.L2 - .Lrtx4) / 4     ; case 18
	.byte	(.L2 - .Lrtx4) / 4     ; case 19
	.byte	(.L6 - .Lrtx4) / 4     ; case 20
	.byte	(.L6 - .Lrtx4) / 4     ; case 21
	.byte	(.L7 - .Lrtx4) / 4     ; case 22
	.text
; всё после выражения ".text" выделяется в сегменте кода (text):
.L7:
; вывести "22"
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	b	puts
.L6:
; вывести "8, 9, 21"
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	b	puts
.L5:
; вывести "3, 4, 5"
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	b	puts
.L3:
; вывести "1, 2, 7, 10"
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	b	puts
.LC0:
	.string	"1, 2, 7, 10"
.LC1:
	.string	"3, 4, 5"
.LC2:
	.string	"8, 9, 21"
.LC3:
	.string	"22"
.LC4:
	.string	"default"
