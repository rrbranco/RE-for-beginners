f_unsigned:
	push	esi
	push	ebx
	sub	esp, 20
	mov	esi, DWORD PTR [esp+32]
	mov	ebx, DWORD PTR [esp+36]
	cmp	esi, ebx
	ja	.L13
	cmp	esi, ebx  ; §cette instruction peut être supprimée§
	je	.L14
.L10:
	jb	.L15
	add	esp, 20
	pop	ebx
	pop	esi
	ret
.L15:
	mov	DWORD PTR [esp+32], OFFSET FLAT:.LC2 ; "a<b"
	add	esp, 20
	pop	ebx
	pop	esi
	jmp	puts
.L13:
	mov	DWORD PTR [esp], OFFSET FLAT:.LC0 ; "a>b"
	call	puts
	cmp	esi, ebx
	jne	.L10
.L14:
	mov	DWORD PTR [esp+32], OFFSET FLAT:.LC1 ; "a==b"
	add	esp, 20
	pop	ebx
	pop	esi
	jmp	puts
