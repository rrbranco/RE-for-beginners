	fld	QWORD PTR [esp+4]	; lade "a"
	fld	QWORD PTR [esp+12]	; lade "b"
	; ST0=b, ST1=a
	fxch	st(1)
	; ST0=a, ST1=b
	; vergleiche "a" und "b"
	fucomi	st, st(1)
	; kopiere ST1 (hier: "b") nach ST0, falls a<=b
	; lasse "a" sonst in ST0
	fcmovbe	st, st(1)
	; verwirf den Wert in ST1
	fstp	st(1)
	ret
