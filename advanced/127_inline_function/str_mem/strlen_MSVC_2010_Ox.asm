_s1$ = 8 ; size = 4
_strlen_test PROC
	mov	eax, DWORD PTR _s1$[esp-4]
	lea	edx, DWORD PTR [eax+1]
$LL3@strlen_tes:
	mov	cl, BYTE PTR [eax]
	inc	eax
	test	cl, cl
	jne	SHORT $LL3@strlen_tes
	sub	eax, edx
	ret	0
_strlen_test ENDP
