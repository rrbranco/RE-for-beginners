_main:
	push	ebp
	mov	ebp, esp
	and	esp, -16
	sub	esp, 16
	call	___main
	mov	eax, DWORD PTR [ebp+12]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR [esp], eax
	call	_atol
	mov	edx, 1717986919
	mov	DWORD PTR [esp], OFFSET FLAT:LC2 ; "%d\12\0"
	lea	ecx, [eax+eax*8]
	mov	eax, ecx
	imul	edx
	sar	ecx, 31
	sar	edx
	sub	edx, ecx
	add	edx, 32
	mov	DWORD PTR [esp+4], edx
	call	_printf
	leave
	ret
