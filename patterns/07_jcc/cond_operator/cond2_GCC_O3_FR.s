.LC0:
	.string	"it is ten"
.LC1:
	.string	"it is not ten"
f:
.LFB0:
; §comparer la valeur en entrée avec 10§
	cmp	DWORD PTR [esp+4], 10
	mov	edx, OFFSET FLAT:.LC1 ; "it is not ten"
	mov	eax, OFFSET FLAT:.LC0 ; "it is ten"
; §si le résultat de la comparaison est Not Equal, copier la valeur de EDX dans EAX§
; sinon, ne rien faire
	cmovne	eax, edx
	ret
