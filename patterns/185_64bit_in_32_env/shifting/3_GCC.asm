_f:
	mov	edx, DWORD PTR [esp+8]
	mov	eax, DWORD PTR [esp+4]
	shrd	eax, edx, 7
	shr	edx, 7
	ret
