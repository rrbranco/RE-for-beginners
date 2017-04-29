my_max:
; X0=A
; X1=B
; comparer A et B:
	cmp	x0, x1
; §copier X0 (A) dans X0 si X0>=X1 ou A>=B (Greater or Equal, supérieur ou égal)§
; copier X1 (B) dans X0 si A<B
	csel	x0, x0, x1, ge
	ret

my_min:
; X0=A
; X1=B
; comparer A et B:
	cmp	x0, x1
; §copier X0 (A) dans X0 si X0<=X1 ou A<=B (Less or Equal, inférieur ou égal)§
; copier X1 (B) dans X0 si A>B
	csel	x0, x0, x1, le
	ret
