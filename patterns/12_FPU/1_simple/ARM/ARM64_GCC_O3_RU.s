f:
; D0 = a, D1 = b
	ldr	d2, .LC25	; 3.14
; D2 = 3.14
	fdiv	d0, d0, d2
; D0 = D0/D2 = a/3.14
	ldr	d2, .LC26	; 4.1
; D2 = 4.1
	fmadd	d0, d1, d2, d0
; D0 = D1*D2+D0 = b*4.1+a/3.14
	ret

; константы в формате IEEE 754:
.LC25:
	.word	1374389535	; 3.14
	.word	1074339512
.LC26:
	.word	1717986918	; 4.1
	.word	1074816614
