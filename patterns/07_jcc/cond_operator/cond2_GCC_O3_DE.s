.LC0:
	.string	"it is ten"
.LC1:
	.string	"it is not ten"
f:
.LFB0:
; vergleiche Eingabewert mit 10
	cmp	DWORD PTR [esp+4], 10
	mov	edx, OFFSET FLAT:.LC1 ; "it is not ten"
	mov	eax, OFFSET FLAT:.LC0 ; "it is ten"
; wenn Operanden ungleich, kopiere EDX nach EAX
; falls nich, tue nichts
	cmovne	eax, edx
	ret
