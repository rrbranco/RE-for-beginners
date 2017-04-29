my_max:
; X0=A
; X1=B
; compare A and B:
	cmp	x0, x1
; select X0 (A) to X0 if X0>=X1 or A>=B (Greater or Equal) 
; select X1 (B) to X0 if A<B
	csel	x0, x0, x1, ge
	ret

my_min:
; X0=A
; X1=B
; compare A and B:
	cmp	x0, x1
; select X0 (A) to X0 if X0<=X1 or A<=B (Less or Equal)
; select X1 (B) to X0 if A>B
	csel	x0, x0, x1, le
	ret
