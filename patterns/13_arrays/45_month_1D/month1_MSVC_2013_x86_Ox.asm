_month$ = 8
_get_month1 PROC
	mov	eax, DWORD PTR _month$[esp-4]
	mov	eax, DWORD PTR _month1[eax*4]
	ret	0
_get_month1 ENDP
