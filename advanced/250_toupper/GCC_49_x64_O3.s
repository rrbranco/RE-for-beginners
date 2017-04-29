toupper:
	lea	edx, [rdi-97] ; 0x61
	lea	eax, [rdi-32] ; 0x20
	cmp	dl, 25
	cmova	eax, edi
	ret
