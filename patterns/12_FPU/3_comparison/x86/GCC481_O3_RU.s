	fld	QWORD PTR [esp+4]	; загрузить "a"
	fld	QWORD PTR [esp+12]	; загрузить "b"
	; ST0=b, ST1=a
	fxch	st(1)
	; ST0=a, ST1=b
	; сравнить "a" и "b"
	fucomi	st, st(1)
	; скопировать ST1 (§там§ "b") в ST0 если a<=b
	; в противном случае, оставить "a" в ST0
	fcmovbe	st, st(1)
	; выбросить значение из ST1
	fstp	st(1)
	ret
