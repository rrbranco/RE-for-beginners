calculate_machine_epsilon:
	fmov	x0, d0       ; загрузить входное значение типа double в X0
	add	x0, x0, 1    ; X0++
	fmov	d1, x0       ; переместить его в регистр FPU
	fsub	d0, d1, d0   ; вычесть
	ret
