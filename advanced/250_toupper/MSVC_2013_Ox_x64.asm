toupper	PROC
	lea	eax, DWORD PTR [rcx-97]
	cmp	al, 25
	ja	SHORT $LN2@toupper
	movsx	eax, cl
	sub	eax, 32
	ret	0
$LN2@toupper:
	movzx	eax, cl
	ret	0
toupper	ENDP
