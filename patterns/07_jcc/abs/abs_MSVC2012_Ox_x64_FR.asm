i$ = 8
my_abs	PROC
; §ECX = valeur en entrée§
	test	ecx, ecx
; §tester le signe de la valeur en entrée§
; sauter l'instruction NEG si le signe est positif
	jns	SHORT $LN2@my_abs
; inverser la valeur
	neg	ecx
$LN2@my_abs:
; §copier le résultat dans EAX:§
	mov	eax, ecx
	ret	0
my_abs	ENDP
