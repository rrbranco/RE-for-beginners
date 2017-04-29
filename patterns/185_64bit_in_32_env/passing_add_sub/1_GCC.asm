_f_add:
	mov	eax, DWORD PTR [esp+12]
	mov	edx, DWORD PTR [esp+16]
	add	eax, DWORD PTR [esp+4]
	adc	edx, DWORD PTR [esp+8]
	ret

_f_add_test:
	sub	esp, 28
	mov	DWORD PTR [esp+8], 1972608889	; 75939f79H
	mov	DWORD PTR [esp+12], 5461	; 00001555H
	mov	DWORD PTR [esp], 1942892530	; 73ce2ff_subH
	mov	DWORD PTR [esp+4], 2874		; 00000b3aH
	call	_f_add
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp], OFFSET FLAT:LC0 ; "%lld\12\0"
	call	_printf
	add	esp, 28
	ret

_f_sub:
	mov	eax, DWORD PTR [esp+4]
	mov	edx, DWORD PTR [esp+8]
	sub	eax, DWORD PTR [esp+12]
	sbb	edx, DWORD PTR [esp+16]
	ret
