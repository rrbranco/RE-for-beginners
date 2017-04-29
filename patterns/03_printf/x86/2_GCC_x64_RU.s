.LC0:
	.string	"a=%d; b=%d; c=%d; d=%d; e=%d; f=%d; g=%d; h=%d\n"

main:
	sub	rsp, 40

	mov	r9d, 5
	mov	r8d, 4
	mov	ecx, 3
	mov	edx, 2
	mov	esi, 1
	mov	edi, OFFSET FLAT:.LC0
	xor	eax, eax ; количество переданных векторных регистров
	mov	DWORD PTR [rsp+16], 8
	mov	DWORD PTR [rsp+8], 7
	mov	DWORD PTR [rsp], 6
	call	printf

	; возврат 0

	xor	eax, eax
	add	rsp, 40
	ret
