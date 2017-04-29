i$ = 8
my_abs	PROC
; ECX = input
	test	ecx, ecx
; §prüfe Vorzeichen des Eingabewertes§
; §überspringe NEG Befehl, falls Vorzeichen positiv ist§
	jns	SHORT $LN2@my_abs
; negiere Wert
	neg	ecx
$LN2@my_abs:
; berechne Ergebnis in EAX:
	mov	eax, ecx
	ret	0
my_abs	ENDP
