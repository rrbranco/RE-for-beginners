.string	"hello, world\n"
main:
	sub	rsp, 8
	mov	edi, OFFSET FLAT:.LC0 ; "hello, world\n"
	xor	eax, eax  ; nombre de registres vectoriels
	call	printf
	xor	eax, eax
	add	rsp, 8
	ret
