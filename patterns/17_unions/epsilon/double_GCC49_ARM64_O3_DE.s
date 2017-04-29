calculate_machine_epsilon:
	fmov	x0, d0       ; lade Eingabewert vom Typ double nach X0
	add	x0, x0, 1    ; X0++
	fmov	d1, x0       ; verschiebe ihn ins FPU Register
	fsub	d0, d1, d0   ; subtrahiere
	ret
