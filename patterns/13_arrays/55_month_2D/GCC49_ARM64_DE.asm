; W0 = Monat
	sxtw	x0, w0
; X0 = vorzeichenerweiterter Eingabewert
	adrp	x1, .LANCHOR1
	add	x1, x1, :lo12:.LANCHOR1
; X1 = Pointer auf die Tabelle
	add	x0, x0, x0, lsl 2
; X0 = X0+X0<<2 = X0+X0*4 = X0*5
	add	x0, x1, x0, lsl 1
; X0 = X1+X0<<1 = X1+X0*2 = Pointer auf die Tabelle + X0*10
	ret
