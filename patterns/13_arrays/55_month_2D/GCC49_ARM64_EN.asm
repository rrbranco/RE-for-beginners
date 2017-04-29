; W0 = month
	sxtw	x0, w0
; X0 = sign-extended input value
	adrp	x1, .LANCHOR1
	add	x1, x1, :lo12:.LANCHOR1
; X1 = pointer to the table
	add	x0, x0, x0, lsl 2
; X0 = X0+X0<<2 = X0+X0*4 = X0*5
	add	x0, x1, x0, lsl 1
; X0 = X1+X0<<1 = X1+X0*2 = pointer to the table + X0*10
	ret
