my_max:
; X0=A
; X1=B
; vergleiche A und B:
	cmp	x0, x1
; setze X0 (A) auf X0, falls X0>=X1 oder A>=B §(größer gleich)§
; setze X1 (B) auf X0, falls A<B
	csel	x0, x0, x1, ge
	ret

my_min:
; X0=A
; X1=B
; vergleiche A und B:
	cmp	x0, x1
; setze X0 (A) auf X0, falls X0<=X1 oder A<=B (kleiner gleich)
; setze X1 (B) auf X0, falls A>B
	csel	x0, x0, x1, le
	ret
