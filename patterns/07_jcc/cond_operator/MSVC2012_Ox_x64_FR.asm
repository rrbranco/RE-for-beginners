$SG1355	DB	'it is ten', 00H
$SG1356	DB	'it is not ten', 00H

a$ = 8
f	PROC
; §charger les pointeurs sur les deux chaînes§
	lea	rdx, OFFSET FLAT:$SG1355 ; 'it is ten'
	lea	rax, OFFSET FLAT:$SG1356 ; 'it is not ten'
; §comparer la valeur en entrée avec 10§
	cmp	ecx, 10
; §si égal, copier la valeur dans RDX ("it is ten")§
; §si non, ne rien faire. le pointeur sur la chaîne "it is not ten" est encore dans RAX à ce stade.§
	cmove	rax, rdx
	ret	0
f	ENDP
