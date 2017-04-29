$SG792	DB	'it is ten', 00H
$SG793	DB	'it is not ten', 00H

_a$ = 8 ; size = 4
_f	PROC
; vergleiche Eingabewert mit 10
	cmp	DWORD PTR _a$[esp-4], 10
	mov	eax, OFFSET $SG792 ; 'it is ten'
; springe zu $LN4@f , falls gleich
	je	SHORT $LN4@f
	mov	eax, OFFSET $SG793 ; 'it is not ten'
$LN4@f:
	ret	0
_f	ENDP
