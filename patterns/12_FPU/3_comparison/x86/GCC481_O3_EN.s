	fld	QWORD PTR [esp+4]	; load "a"
	fld	QWORD PTR [esp+12]	; load "b"
	; ST0=b, ST1=a
	fxch	st(1)
	; ST0=a, ST1=b
	; compare "a" and "b"
	fucomi	st, st(1)
	; copy ST1 ("b" here) to ST0 if a<=b
	; leave "a" in ST0 otherwise
	fcmovbe	st, st(1)
	; discard value in ST1
	fstp	st(1)
	ret
