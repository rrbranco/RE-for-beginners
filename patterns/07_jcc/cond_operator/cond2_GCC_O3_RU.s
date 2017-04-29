.LC0:
	.string	"it is ten"
.LC1:
	.string	"it is not ten"
f:
.LFB0:
; сравнить входное значение с 10
	cmp	DWORD PTR [esp+4], 10
	mov	edx, OFFSET FLAT:.LC1 ; "it is not ten"
	mov	eax, OFFSET FLAT:.LC0 ; "it is ten"
; если результат сравнение Not Equal §(не равно)§, скопировать значение из EDX в EAX
; а если нет, то ничего не делать
	cmovne	eax, edx
	ret
