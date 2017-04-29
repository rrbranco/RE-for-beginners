.LC0:
	.string	"%d %d %d %d %d %d %d\n"
f1:
	sub	rsp, 40
	mov	eax, DWORD PTR [rsp+48]
	mov	DWORD PTR [rsp+8], r9d
	mov	r9d, ecx
	mov	DWORD PTR [rsp], r8d
	mov	ecx, esi
	mov	r8d, edx
	mov	esi, OFFSET FLAT:.LC0
	mov	edx, edi
	mov	edi, 1
	mov	DWORD PTR [rsp+16], eax
	xor	eax, eax
	call	__printf_chk
	add	rsp, 40
	ret
main:
	sub	rsp, 24
	mov	r9d, 6
	mov	r8d, 5
	mov	DWORD PTR [rsp], 7
	mov	ecx, 4
	mov	edx, 3
	mov	esi, 2
	mov	edi, 1
	call	f1
	add	rsp, 24
	ret
