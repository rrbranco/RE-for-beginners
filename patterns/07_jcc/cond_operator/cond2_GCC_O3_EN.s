.LC0:
	.string	"it is ten"
.LC1:
	.string	"it is not ten"
f:
.LFB0:
; compare input value with 10
	cmp	DWORD PTR [esp+4], 10
	mov	edx, OFFSET FLAT:.LC1 ; "it is not ten"
	mov	eax, OFFSET FLAT:.LC0 ; "it is ten"
; if comparison result is Not Equal, copy EDX value to EAX
; if not, do nothing
	cmovne	eax, edx
	ret
