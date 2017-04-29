; a*7
f1:
	lsl	x1, x0, 3
; X1=X0<<3=X0*8=a*8
	sub	x0, x1, x0
; X0=X1-X0=a*8-a=a*7
	ret

; a*28
f2:
	lsl	x1, x0, 5
; X1=X0<<5=a*32
	sub	x0, x1, x0, lsl 2
; X0=X1-X0<<2=a*32-a<<2=a*32-a*4=a*28
	ret

; a*17
f3:
	add	x0, x0, x0, lsl 4
; X0=X0+X0<<4=a+a*16=a*17
	ret
