i$ = 8
my_abs	PROC
; ECX = input
	test	ecx, ecx
; проверить знак входного значения
; пропустить инструкцию NEG, если знак положительный
	jns	SHORT $LN2@my_abs
; поменять знак
	neg	ecx
$LN2@my_abs:
; подготовить результат в EAX:
	mov	eax, ecx
	ret	0
my_abs	ENDP
