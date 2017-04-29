i$ = 8
my_abs	PROC
; ECX = input
	test	ecx, ecx
; check for sign of input value
; skip NEG instruction if sign is positive
	jns	SHORT $LN2@my_abs
; negate value
	neg	ecx
$LN2@my_abs:
; prepare result in EAX:
	mov	eax, ecx
	ret	0
my_abs	ENDP
