_a$ = 8		; size = 8
_f	PROC
	mov	eax, DWORD PTR _a$[esp-4]
	mov	edx, DWORD PTR _a$[esp]
	shrd	eax, edx, 7
	shr	edx, 7
	ret	0
_f	ENDP
