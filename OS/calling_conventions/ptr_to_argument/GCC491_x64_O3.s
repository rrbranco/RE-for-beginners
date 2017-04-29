.LC0:
	.string	"%d\n"
f:
	sub	rsp, 24
	mov	DWORD PTR [rsp+12], edi  ; store input value to the local stack
	lea	rdi, [rsp+12]            ; take an address of the value and pass it to modify_a()
	call	modify_a
	mov	edx, DWORD PTR [rsp+12]  ; reload value from the local stack and pass it to printf()
	mov	esi, OFFSET FLAT:.LC0    ; '%d'
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk
	add	rsp, 24
	ret
