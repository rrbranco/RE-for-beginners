.string	"hello, world\n"
main:
	sub	rsp, 8
	mov	edi, OFFSET FLAT:.LC0 ; "hello, world\n"
	xor	eax, eax  ; количество переданных векторных регистров
	call	printf
	xor	eax, eax
	add	rsp, 8
	ret
