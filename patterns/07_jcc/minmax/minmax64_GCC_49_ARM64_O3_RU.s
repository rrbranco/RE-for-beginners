my_max:
; X0=A
; X1=B
; сравнить A и B:
	cmp	x0, x1
; выбрать X0 (A) в X0 если X0>=X1 или A>=B (Greater or Equal: §больше§ §или§ §равно§) 
; выбрать X1 (B) в X0 если A<B
	csel	x0, x0, x1, ge
	ret

my_min:
; X0=A
; X1=B
; сравнить A и B:
	cmp	x0, x1
; выбрать X0 (A) в X0 если X0<=X1 (Less or Equal: §меньше§ §или§ §равно§)
; выбрать X1 (B) в X0 если A>B
	csel	x0, x0, x1, le
	ret
