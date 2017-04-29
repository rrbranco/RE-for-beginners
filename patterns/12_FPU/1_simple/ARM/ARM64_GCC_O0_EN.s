f:
	sub	sp, sp, #16
	str	d0, [sp,8]	; save "a" in Register Save Area
	str	d1, [sp]	; save "b" in Register Save Area
	ldr	x1, [sp,8]
; X1 = a
	ldr	x0, .LC25
; X0 = 3.14
	fmov	d0, x1
	fmov	d1, x0
; D0 = a, D1 = 3.14
	fdiv	d0, d0, d1
; D0 = D0/D1 = a/3.14

	fmov	x1, d0
; X1 = a/3.14
	ldr	x2, [sp]
; X2 = b
	ldr	x0, .LC26
; X0 = 4.1
	fmov	d0, x2
; D0 = b
	fmov	d1, x0
; D1 = 4.1
	fmul	d0, d0, d1
; D0 = D0*D1 = b*4.1

	fmov	x0, d0
; X0 = D0 = b*4.1
	fmov	d0, x1
; D0 = a/3.14
	fmov	d1, x0
; D1 = X0 = b*4.1
	fadd	d0, d0, d1
; D0 = D0+D1 = a/3.14 + b*4.1

	fmov	x0, d0 ; \ redundant code
	fmov	d0, x0 ; /
	add	sp, sp, 16
	ret
.LC25:
	.word	1374389535	; 3.14
	.word	1074339512
.LC26:
	.word	1717986918	; 4.1
	.word	1074816614
