; W0 = месяц
	sxtw	x0, w0
; X0 = расширить входное значение учитывая знак
	adrp	x1, .LANCHOR1
	add	x1, x1, :lo12:.LANCHOR1
; X1 = указатель на таблицу
	add	x0, x0, x0, lsl 2
; X0 = X0+X0<<2 = X0+X0*4 = X0*5
	add	x0, x1, x0, lsl 1
; X0 = X1+X0<<1 = X1+X0*2 = указатель на таблицу + X0*10
	ret
