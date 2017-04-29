$SG2923	DB	'a=%d; b=%d; c=%d; d=%d; e=%d; f=%d; g=%d; h=%d', 0aH, 00H

main	PROC
	sub	rsp, 88

	mov	DWORD PTR [rsp+64], 8
	mov	DWORD PTR [rsp+56], 7
	mov	DWORD PTR [rsp+48], 6
	mov	DWORD PTR [rsp+40], 5
	mov	DWORD PTR [rsp+32], 4
	mov	r9d, 3
	mov	r8d, 2
	mov	edx, 1
	lea	rcx, OFFSET FLAT:$SG2923
	call	printf

	; renvoyer 0
	xor	eax, eax

	add	rsp, 88
	ret	0
main	ENDP
_TEXT	ENDS
END
