calculate_machine_epsilon:
	fmov	x0, d0       ; load input value of double type into X0
	add	x0, x0, 1    ; X0++
	fmov	d1, x0       ; move it to FPU register
	fsub	d0, d1, d0   ; subtract
	ret
