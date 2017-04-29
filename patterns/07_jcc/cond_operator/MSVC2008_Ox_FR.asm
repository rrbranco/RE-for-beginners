$SG792	DB	'it is ten', 00H
$SG793	DB	'it is not ten', 00H

_a$ = 8 ; taille = 4
_f	PROC
; §comparer la valeur en entrée avec 10§
	cmp	DWORD PTR _a$[esp-4], 10
	mov	eax, OFFSET $SG792 ; 'it is ten'
; §sauter en \$LN4@f si égal§
	je	SHORT $LN4@f
	mov	eax, OFFSET $SG793 ; 'it is not ten'
$LN4@f:
	ret	0
_f	ENDP
